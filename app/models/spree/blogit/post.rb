module Spree
  module Blogit
    class Post < ActiveRecord::Base

      self.table_name = "blogit_posts"

      require "kaminari"
      require "acts-as-taggable-on"

      acts_as_taggable
      ActsAsTaggableOn.force_parameterize = true

      self.paginates_per(SpreeBlogit.configuration.posts_per_page)

      # ===============
      # = Validations =
      # ===============

      validates :title, presence: true, length: { minimum: 10, maximum: 66 }

      validates :body,  presence: true, length: { minimum: 10 }

      validates :slug,  presence: true, length: { minimum: 5 }

      validates :description, presence: SpreeBlogit.configuration.show_post_description

      validates :blogger_id, presence: true

      validates :state, presence: true

      # ================
      # = Associations =
      # ================

      ##
      # The blogger (User, Admin, etc.) who wrote this Post
      #
      # Returns a Blogger (polymorphic type)
      belongs_to :blogger, :polymorphic => true

      ##
      # The {Comment Comments} written on this Post
      #
      # Returns an ActiveRecord::Relation instance
      has_many :comments, :class_name => 'Spree::Blogit::Comment'

      # ==========
      # = Scopes =
      # ==========

      scope :for_index, lambda { |page_no = 1|
        active.order("created_at DESC").page(page_no) }

      scope :active, lambda { where(state:  SpreeBlogit.configuration.active_states ) }


      # The posts to be displayed for RSS and XML feeds/sitemaps
      #
      # Returns an ActiveRecord::Relation
      def self.for_feed
        active.order('created_at DESC')
      end

      # Raises ActiveRecord::RecordNotFound if no post found
      def self.active_with_id(title)
        active.find_by!(slug: title)
      end

      # ====================
      # = Instance Methods =
      # ====================

      # TODO: Get published at working properly!
      def published_at
        created_at
      end

      def to_param
        if Spree::Admin
          id
        else
          slug
        end
      end

      # The content of the Post to be shown in the RSS feed.
      #
      # Returns description when Blogit.configuration.show_post_description is true
      # Returns body when Blogit.configuration.show_post_description is false
      def short_body
        if SpreeBlogit.configuration.show_post_description
          description
        else
          body
        end
      end

      def comments
        check_comments_config
        super()
      end

      def comments=(value)
        check_comments_config
        super(value)
      end


      # The blogger who wrote this {Post Post's} display name
      #
      # Returns the blogger's display name as a String if it's set.
      # Returns an empty String if blogger is not present.
      # Raises a ConfigurationError if the method called is not defined on {#blogger}
      def blogger_display_name
        return "" if blogger.blank?
        if blogger.respond_to?(SpreeBlogit.configuration.blogger_display_name_method)
          blogger.send(SpreeBlogit.configuration.blogger_display_name_method)
        else
          method_name = SpreeBlogit.configuration.blogger_display_name_method
          raise SpreeBlogit::ConfigurationError, "#{blogger.class}##{method_name} is not defined"
        end
      end

      # If there's a blogger and that blogger responds to :twitter_username, returns that.
      # Otherwise, returns nil
      def blogger_twitter_username
        if blogger and blogger.respond_to?(:twitter_username)
          blogger.twitter_username
        end
      end

      def self.for_admin_index(page_no)
        page(page_no).order('created_at DESC').per(10)
      end

      private


      def check_comments_config
        unless SpreeBlogit.configuration.include_comments == :active_record
          raise RuntimeError,
            "Posts only allow active record comments (check blogit configuration)"
        end
      end

    end
  end
end
