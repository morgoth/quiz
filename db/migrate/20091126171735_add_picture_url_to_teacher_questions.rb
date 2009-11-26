class AddPictureUrlToTeacherQuestions < ActiveRecord::Migration
  def self.up
    add_column :teacher_questions, :picture_url, :string
  end

  def self.down
    remove_column :teacher_questions, :picture_url
  end
end
