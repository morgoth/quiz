module ApplicationHelper
  include TagsHelper

  def flash_messages
    return if flash.empty?
    messages = ''
    flash.each do |key, msg|
      messages <<  content_tag(:div, msg, :class => key)
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

  def setup_picture(imageable)
    returning(imageable) do |i|
      (i.picture = Picture.new) if i.picture.nil?
    end
  end

  def picture_tag(imageable)
    klass = "teacher_" + imageable.class.name.underscore
    image_tag(imageable.send(klass.to_sym).picture.picture.url) if imageable.send(klass.to_sym).picture
  end

  def localize_exam_state(state)
    I18n.t("views.exam_state.#{state}")
  end

  def teacher_question_types_for_select
    collection = []
    TeacherQuestion::QUESTION_TYPES.each do |type|
      collection << [I18n.t("question_type.#{type}"), type]
    end
    collection
  end

  def localize_question_type(type)
    I18n.t("question_type.#{type}")
  end

  def students_for_select
    Student.all
  end
end
