class AddQuestionNumberToTeacherExam < ActiveRecord::Migration
  def self.up
    add_column :teacher_exams, :question_number, :integer
  end

  def self.down
    remove_column :teacher_exams, :question_number
  end
end
