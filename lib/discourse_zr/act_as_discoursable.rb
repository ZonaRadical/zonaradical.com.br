module DiscourseZr
  module ActAsDiscoursable
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def act_as_discoursable(options = {})
        cattr_accessor :discourse_title, instance_accessor: false
        cattr_accessor :discourse_raw, instance_accessor: false
        cattr_accessor :discourse_category, instance_accessor: false
        cattr_accessor :discourse_username, instance_accessor: false
        self.discourse_title = options[:title]
        self.discourse_raw = options[:description]
        self.discourse_category = options[:category]
        self.discourse_username = options[:username]

        before_save :create_or_update_discourse_topic
        before_destroy :destroy_discourse_topic

        include DiscourseZr::ActAsDiscoursable::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def discourse_comments
        topic = discourse_client.topic(self.discourse_topic_id)
        comments = topic['post_stream']['posts']
        comments.shift # discard first post (tour description)
        comments
      end

      private

      def create_or_update_discourse_topic
        update_topic if self.discourse_topic_id.present?
        create_topic if self.discourse_topic_id.nil?
      end

      def destroy_discourse_topic
        discourse_client.delete_topic(self.discourse_topic_id)
      end

      def create_topic
        topic = discourse_client.create_topic(
          title: discourse_title,
          raw: discourse_raw,
          category: discourse_category
        )
        self.discourse_topic_id = topic['topic_id']
      end

      def update_topic
        discourse_client.rename_topic(self.discourse_topic_id, discourse_title)
        topic = discourse_client.topic(self.discourse_topic_id)
        post_id = topic['post_stream']['posts'].first['id']
        discourse_client.edit_post(post_id, discourse_raw)
      end

      def discourse_client
        @discourse_client ||= ::DiscourseZr.client(
          username: instance_eval(&self.class.discourse_username)
        )
      end

      def discourse_title
        @discourse_title ||= instance_eval(&self.class.discourse_title)
      end

      def discourse_raw
        @discourse_raw ||= instance_eval(&self.class.discourse_raw)
      end

      def discourse_category
        @discourse_category ||= instance_eval(&self.class.discourse_category)
      end

      def discourse_username
        @discourse_username ||= instance_eval(&self.class.discourse_username)        
      end
    end
  end
end

ActiveRecord::Base.send :include, DiscourseZr::ActAsDiscoursable