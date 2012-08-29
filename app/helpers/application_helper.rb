module ApplicationHelper

  def error_messages_for(object)
   if object.errors.any?
     content_tag :ul do
      object.errors.full_messages.map do |msg|
        content_tag :li, msg
      end.join("").html_safe
     end
   end
  end
end
