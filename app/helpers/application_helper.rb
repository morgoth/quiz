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

  def menu_link_to(controller_name, name, options = {}, html_options = {})
    controller_name = Array(controller_name)
    classes = (html_options[:class] || "").split(" ")
    classes << "active" if controller_name.include?(controller.controller_name)
    html_options[:class] = classes.join(" ")
    link_to(name, options, html_options)
  end
end
