class AddInfoToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :content_type, :string
    add_column :assets, :file_size, :integer
  end

  def self.down
    remove_column :assets, :file_size
    remove_column :assets, :content_type
  end
end
