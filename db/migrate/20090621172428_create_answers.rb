class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :teacher_answer_id
      t.integer :question_id
      t.string :value
      t.integer :position
      t.float :points

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
