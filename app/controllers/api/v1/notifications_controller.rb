module Api
    module V1
        class NotificationsController < ApplicationController
            before_action :set_user
            before_action :set_notification, only: [:show, :update]
            before_action :format_notification, only: [:show,]
            before_action :set_notifications, only: [:index]

            def index
                json_response(@client_notifications)
            end

            def show
                json_response(@client_notification_formated)
            end

            def update
                @client_notification.update(notification_params)
                head :no_content
            end

            private 

            def notification_params
                params.permit(:seen)
            end

            def set_user
                @user = User.find(params[:user_id])
            end

            def set_notification
                @client_notification = @user.clientNotifications.
                                            joins(:notification).
                                            where!(user_id: params[:user_id], notification_id: params[:id]) if @user
            end

            def format_notification
                select_string_list = [
                    'notification_id',
                    'user_id',
                    'seen', 
                    'notifications.title', 
                    'notifications.body',
                    'notifications.created_at'
                ]
                @client_notification_formated = @client_notification.pluck(select_string_list).
                                            map{ |id, user_id, seen, title, body, created_at| 
                                                {
                                                    id: id,
                                                    user_id: user_id,
                                                    seen: seen,
                                                    title: title,
                                                    body: body,
                                                    date: created_at
                                                }
                                            } if @client_notification
            end

            def set_notifications
                select_string_list = [
                    'notifications.id', 
                    'client_notifications.seen', 
                    'notifications.title', 
                    'notifications.body',
                    'notifications.created_at'
                ]
                @client_notifications = @user.clientNotifications.
                                            joins(:notification).
                                            pluck(select_string_list).
                                            map{ |id, seen, title, body, created_at| 
                                                {
                                                    id: id,
                                                    seen: seen,
                                                    title: title,
                                                    body: body,
                                                    date: created_at
                                                }
                                            } if @user
            end
        end
    end
end

