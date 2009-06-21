Factory.define :answer do |f|
  f.association :question
  f.association :teacher_answer
end