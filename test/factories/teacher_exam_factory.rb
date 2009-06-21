Factory.define :teacher_exam do |f|
  f.name 'name of the exam'
  f.teacher { |teacher| teacher.association(:teacher) }
end