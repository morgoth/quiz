Factory.define :question do |f|
  f.association :exam
  f.association :teacher_question
  f.state_event 'prepare'
end