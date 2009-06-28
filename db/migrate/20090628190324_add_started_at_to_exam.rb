class AddStartedAtToExam < ActiveRecord::Migration
  def self.up
    add_column :exams, :started_at, :datetime
  end

  def self.down
    remove_column :exams, :started_at
  end
end
