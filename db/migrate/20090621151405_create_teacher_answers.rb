class CreateTeacherAnswers < ActiveRecord::Migration
  def self.up
    create_table :teacher_answers do |t|
      t.integer :teacher_question_id
      t.text :content
      t.float :points

      t.timestamps
    end
  end

  def self.down
    drop_table :teacher_answers
  end
end
