class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :teacher_question_id
      t.integer :exam_id

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
