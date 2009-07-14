# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper

  def flash_messages
    return if flash.empty?
    messages = ''
    flash.each do |key, msg|
      messages <<  content_tag( :div, msg, :class => key)
    end
    messages
  end
end
