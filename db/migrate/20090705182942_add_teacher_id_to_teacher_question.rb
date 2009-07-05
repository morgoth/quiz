class AddTeacherIdToTeacherQuestion < ActiveRecord::Migration
  def self.up
    add_column :teacher_questions, :teacher_id, :integer
  end

  def self.down
    remove_column :teacher_questions, :teacher_id
  end
end
