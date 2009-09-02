class RemoveDurationFromTeacherExam < ActiveRecord::Migration
  def self.up
    remove_column :teacher_exams, :duration
    add_column :teacher_exams, :duration, :integer
  end

  def self.down
    remove_column :teacher_exams, :duration
    add_column :teacher_exams, :duration, :time
  end
end
