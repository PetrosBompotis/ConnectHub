module Shared::ConversationsHelper

  def private_conv_seen_status(conversation)
    # if the latest message of a conversation is not created by a current_user
    # and it is unseen, return an unseen-conv value
    not_created_by_user = conversation.messages.last.user_id != current_user.id
    unseen = conversation.messages.last.seen == false
    not_created_by_user && unseen ? 'unseen-conv' : ''
  end

  def group_conv_seen_status(conversation, current_user)
    if current_user.nil?
      ''
    elsif conversation.messages.last.nil?  # Check if there are any messages
      ''
    else
      not_created_by_user = conversation.messages.last.user_id != current_user.id
      seen_by_user = conversation.messages.last.seen_by.include?(current_user.id)
      not_created_by_user && !seen_by_user ? 'unseen-conv' : ''
    end
  end

end