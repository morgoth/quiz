Factory.define :teacher_exam do |f|
  f.name 'name of the exam'
  f.association :teacher
  f.duration 5
end