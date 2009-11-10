class MassExam < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :teacher_exam
  validates_presence_of :teacher_exam, :student_ids
  # FIXME: when :new is rendered student ids not match
  attr_accessor :student_ids

  before_validation :remove_blank_ids
  before_save :create_exams

  private

  def remove_blank_ids
    student_ids.delete "" if student_ids
  end

  def create_exams
    student_ids.each do |student_id|
      Exam.create!(:student_id => student_id, :teacher_exam => teacher_exam, :state_event => 'prepare')
    end
  end
end
