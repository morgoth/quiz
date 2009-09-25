class Student < User
  has_many :exams
  acts_as_taggable_on :groups

  attr_accessible :group_list

  def to_label
    full_name.present? ? full_name : login
  end
end
