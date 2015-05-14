class AddDiscourseTopicIdToTours < ActiveRecord::Migration
  def change
    add_column :tours, :discourse_topic_id, :integer
  end
end
