class RemoveAuthorNameFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :author_name
  end

  def self.down
  end
end
