class CreateTeacherQuestions < ActiveRecord::Migration
  def self.up
    create_table :teacher_questions do |t|
      t.text :content
      t.string :question_type

      t.timestamps
    end
  end

  def self.down
    drop_table :teacher_questions
  end
end
