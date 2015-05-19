require 'active_support/concern'

module Slug
  extend ActiveSupport::Concern

  module ClassMethods
    def slugged(field)
      extend FriendlyId
      friendly_id field, use: :slugged
    end
  end

  included do
    validates :slug, presence: true
  end

  def slug_preview
    set_slug
  end
end
