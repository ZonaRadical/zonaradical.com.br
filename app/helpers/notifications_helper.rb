module NotificationsHelper
  def unread_notifications
    render partial: '/mailboxer/notifications/notification',
      collection: current_user.mailbox.notifications(read: false) if user_signed_in?
  end
end