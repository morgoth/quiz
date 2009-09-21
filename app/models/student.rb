class Student < User
  has_many :exams
  acts_as_taggable_on :groups

  attr_accessible :group_list
end
