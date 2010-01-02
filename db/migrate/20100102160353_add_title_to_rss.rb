class AddTitleToRss < ActiveRecord::Migration
  def self.up
    add_column :rsses, :title, :string
  end

  def self.down
    remove_column :rsses, :title
  end
end
