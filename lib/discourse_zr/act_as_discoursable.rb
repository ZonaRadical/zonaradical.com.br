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
        cattr_accessor :discourse_external_id, instance_accessor: false
        self.discourse_title = options[:title]
        self.discourse_raw = options[:description]
        self.discourse_category = options[:category]
        self.discourse_external_id = options[:external_id]

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
        comments.reverse # from last to first post
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
      rescue DiscourseApi::Error => e
        parse_discourse_error(e.message)
      rescue
        discourse_unknow_error
      end

      def update_topic
        discourse_client.rename_topic(self.discourse_topic_id, discourse_title)
        topic = discourse_client.topic(self.discourse_topic_id)
        post_id = topic['post_stream']['posts'].first['id']
        discourse_client.edit_post(post_id, discourse_raw)
      end

      def discourse_client
        
        @discourse_client ||= ::DiscourseZr.client(
          username: discourse_username
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
        return @discourse_username if @discourse_username
        discourse_user = DiscourseZr.client.user_by_external_id(
          instance_eval(&self.class.discourse_external_id)
        )
        discourse_user = DiscourseZr.sync_sso(
          User.find(instance_eval(&self.class.discourse_external_id))
        ) if discourse_user.nil?
        @discourse_username = discourse_user['username']
      end

      def parse_discourse_error(message)
        begin
          discourse_errors = JSON.parse(message.gsub('=>',':'))['errors']
          discourse_errors.each do |error|
            if error =~ /^Title/
              error = error.gsub(/^Title/, '')
              errors.add(:title, error)
            elsif error =~ /^Body/
              error = error.gsub(/^Body/, '')
              errors.add(:description, error)
            else
              errors.add(:base, error)
            end
          end
          false
        rescue
          unknow_error
        end
      end

      def discourse_unknow_error
        errors.add(:base, 'Ocorreu um erro desconhecido, por favor tente novamente. Se o problema persistir, contate o administrador do sistema.')
        false
      end
    end
  end
end

ActiveRecord::Base.send :include, DiscourseZr::ActAsDiscoursable