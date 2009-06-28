class AddDurationToTeacherExam < ActiveRecord::Migration
  def self.up
    add_column :teacher_exams, :duration, :time
  end

  def self.down
    remove_column :teacher_exams, :duration
  end
end
