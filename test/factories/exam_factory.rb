Factory.define :exam do |f|
  f.association :student
  f.association :teacher_exam
  f.state_event 'prepare'
end