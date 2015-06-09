# create_table :videos, force: true do |t|
#   t.string   :title
#   t.text     :description
#   t.integer  :source_cd
#   t.integer  :video_category_id
#   t.string   :source_link
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.string   :slug
# end

class Video < ActiveRecord::Base
  as_enum :source, youtube: 0, vimeo: 1
  belongs_to :video_category
  validates :title, presence: true
  validates :source_link, presence: true
end
