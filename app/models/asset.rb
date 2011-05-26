class Asset < ActiveRecord::Base

  mount_uploader :asset, AssetUploader

  before_save :update_asset_attributes

  belongs_to :user

  validates_presence_of :asset

  def image?
    content_type.include? 'image'
  end

  private

  def update_asset_attributes
    self.content_type = asset.file.content_type
    self.file_size = asset.file.size
  end
end

