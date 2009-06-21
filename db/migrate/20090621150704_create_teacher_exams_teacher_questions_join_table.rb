class CreateTeacherExamsTeacherQuestionsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :teacher_exams_teacher_questions, :id => false do |t|
      t.integer :teacher_exam_id
      t.integer :teacher_question_id
    end
  end

  def self.down
    drop_table :teacher_exams_teacher_questions
  end
end
