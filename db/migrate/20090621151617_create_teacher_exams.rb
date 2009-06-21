class CreateTeacherExams < ActiveRecord::Migration
  def self.up
    create_table :teacher_exams do |t|
      t.integer :teacher_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :teacher_exams
  end
end
