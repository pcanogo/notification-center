module Api
    module V1
        class NotificationsController < ApplicationController
            before_action :set_user
            before_action :set_notification, only: [:show, :update]
            before_action :set_notifications, only: [:index]

            def index
                json_response(@client_notifications)
            end

            def show
                json_response(@client_notification)
            end

            def update
                puts "THIS IS THE USER"
                puts @client_notification.user_id
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
                select_string_list = [
                    'id', 
                    'user_id',
                    'notification_id',
                    'seen', 
                    'notifications.title', 
                    'notifications.body',
                    'notifications.created_at'
                ]
                @client_notification = @user.clientNotifications.
                                            joins(:notification).
                                            select(select_string_list).
                                            find_by!(id: params[:id]) if @user
            end

            def set_notifications
                select_string_list = [
                    'id', 
                    'seen', 
                    'notifications.title', 
                    'notifications.body',
                    'notifications.created_at'
                ]
                @client_notifications = @user.clientNotifications.
                                            joins(:notification).
                                            select(select_string_list) if @user
            end
        end
    end
end

