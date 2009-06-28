class CreateStudentImports < ActiveRecord::Migration
  def self.up
    create_table :student_imports do |t|
      t.integer :teacher_id

      t.timestamps
    end
  end

  def self.down
    drop_table :student_imports
  end
end
