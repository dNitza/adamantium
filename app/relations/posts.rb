# frozen_string_literal: true

module Adamantium
  module Relations
    class Posts < ROM::Relation[:sql]
      schema :posts, infer: true do
        associations do
          has_many :post_tags
          has_many :tags, through: :post_tags

          has_many :post_trips
          has_many :trips, through: :post_trips

          has_many :reactions

          has_many :webmentions
        end
      end

      auto_struct(true)

      def published
        where(self[:published_at] <= Time.now)
      end

      def weekly
        ref = post_tags.where(tag_id: "70").select(:post_id).dataset
        where(id: ref)
      end

      def non_weekly
        ref = post_tags.where(tag_id: "70").select(:post_id).dataset
        exclude(id: ref)
      end

      def published_between(start_date, end_date)
        where(self[:published_at] >= start_date)
          .where(self[:published_at] <= end_date)
      end

      def search(term:)
        where(Sequel.ilike(:content, "%#{term}%"))
      end
    end
  end
end
