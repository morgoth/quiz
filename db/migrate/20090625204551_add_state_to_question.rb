class AddStateToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :state, :string
  end

  def self.down
    remove_column :questions, :state
  end
end
