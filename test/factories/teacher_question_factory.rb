Factory.define :teacher_question do |f|
  f.content 'question content'
  f.question_type 'radio_button'
  f.association :teacher
end
