class Resort < ActiveRecord::Base

  validates :name, presence: true
  validates :image, presence: true

  mount_uploader :image, ResortImageUploader

  def country
    @country = Carmen::Country.coded(self.country_code).name
  end
end
