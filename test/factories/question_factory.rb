Factory.define :question do |f|
  f.association :exam
  f.association :teacher_question
end