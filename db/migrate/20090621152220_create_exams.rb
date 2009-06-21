class CreateExams < ActiveRecord::Migration
  def self.up
    create_table :exams do |t|
      t.integer :student_id
      t.integer :teacher_exam_id

      t.timestamps
    end
  end

  def self.down
    drop_table :exams
  end
end
