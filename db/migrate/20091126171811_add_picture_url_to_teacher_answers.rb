class AddPictureUrlToTeacherAnswers < ActiveRecord::Migration
  def self.up
    add_column :teacher_answers, :picture_url, :string
  end

  def self.down
    remove_column :teacher_answers, :picture_url
  end
end
