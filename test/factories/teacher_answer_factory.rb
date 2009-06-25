Factory.define :teacher_answer do |f|
  f.association :teacher_question
  f.sequence(:content) { |n| "answer nr #{n}" }
  f.points 0.4
end