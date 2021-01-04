module Api
    module V1
        module Admin
            class NotificationsController < ApplicationController
                before_action :set_notification, only: [:show]
                before_action :post_client_notification, only: [:clients]
                before_action :post_notification, only: [:create]

                def index
                    json_response(Notification.all)
                end

                def show
                    json_response(@client_notifications)
                end

                def clients
                    json_response(@notifications, :created)
                end

                def create
                    json_response(@notifications, :created)
                end

                private 

                def notification_params
                    params.permit(:title, :body)
                end

                def c_notification_params
                    params.permit(:clients => [])
                end
    
                def set_notification
                    @client_notifications = ClientNotification.
                                                where(notification_id: params[:id]).
                                                pluck(:user_id, :seen).
                                                map{ |user_id, seen| 
                                                    {
                                                        user_id: user_id,
                                                        seen: seen
                                                    }
                                                }
                end

                def post_client_notification 
                    clients = c_notification_params[:clients]

                    Notification.transaction do
                        @notifications = Notification.create!(notification_params)
                        c_notification_params = clients.map{ |client_id|
                            {
                                notification_id: @notifications.id,
                                user_id: client_id
                            }
                        }
                        ClientNotification.create!(c_notification_params)
                    end
                end 

                def post_notification
                    clients = User.where(is_admin: false).pluck(:id)

                    Notification.transaction do
                        @notifications = Notification.create!(notification_params)
                        c_notification_params = clients.map{ |client_id|
                            {
                                notification_id: @notifications.id,
                                user_id: client_id
                            }
                        }
                        ClientNotification.create!(c_notification_params)
                    end
                end
            end
        end
    end
end

