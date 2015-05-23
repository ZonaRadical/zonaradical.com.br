module DiscourseApi
  module API
    module Users
      def user_by_external_id(external_id)
        response = get("/users/by-external/#{external_id}")
        response[:body]['user']
      end

      def user_sso(username)
        response = get("/admin/users/#{username}")
        response[:body]['single_sign_on_record']
      end
    end
  end
end

Rails.configuration.to_prepare do
  DiscourseApi::Client.class_eval do
    include DiscourseApi::API::Users
  end
end