class AddAuthlogicMagicColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :current_login_at, :datetime
    add_column :users, :current_login_ip, :string
    add_column :users, :failed_login_count, :integer
  end

  def self.down
    remove_column :users, :current_login_at
    remove_column :users, :current_login_ip
    remove_column :users, :failed_login_count
  end
end
