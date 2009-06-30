class CreateMassExams < ActiveRecord::Migration
  def self.up
    create_table :mass_exams do |t|
      t.integer :teacher_id
      t.integer :teacher_exam_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mass_exams
  end
end
