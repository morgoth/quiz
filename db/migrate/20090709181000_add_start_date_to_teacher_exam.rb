class AddStartDateToTeacherExam < ActiveRecord::Migration
  def self.up
    add_column :teacher_exams, :start_date, :datetime
  end

  def self.down
    remove_column :teacher_exams, :start_date
  end
end
