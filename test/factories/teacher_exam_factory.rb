Factory.define :teacher_exam do |f|
  f.name 'name of the exam'
  f.association :teacher
  f.duration '2001-01-01 00:05:00'
end