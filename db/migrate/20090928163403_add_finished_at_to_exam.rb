class AddFinishedAtToExam < ActiveRecord::Migration
  def self.up
    add_column :exams, :finished_at, :datetime
  end

  def self.down
    remove_column :exams, :finished_at
  end
end
