Factory.define :teacher_answer do |f|
  f.sequence(:content) { |n| "answer nr #{n}" }
  f.points 0.4
end