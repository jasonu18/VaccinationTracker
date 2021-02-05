module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'application/error_messages', :locals => {objcet => object})
  end
end
