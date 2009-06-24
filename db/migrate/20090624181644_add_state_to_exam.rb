class AddStateToExam < ActiveRecord::Migration
  def self.up
    add_column :exams, :state, :string
  end

  def self.down
    remove_column :exams, :state
  end
end
