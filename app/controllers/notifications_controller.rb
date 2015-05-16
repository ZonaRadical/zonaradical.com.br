class NotificationsController < ApplicationController
  load_resource :notification, class: 'Mailboxer::Notification', through: :current_user

  respond_to :js

  def destroy
    @notification.mark_as_read(current_user)
    respond_with @notification
  end
end