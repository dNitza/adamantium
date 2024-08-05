require "time_math"

module Admin
  module Repos
    class PageRepo < Adamantium::DB::Repo[:pages]
      commands :create, update: :by_pk

      def list
        pages
          .order(Sequel.lit("published_at desc"))
          .to_a
      end

      def find(slug:)
        pages.where(slug: slug).one!
      end

      def delete(slug:)
        pages.where(slug: slug).delete
      end

      def publish(slug:)
        pages.where(slug: slug).update(published_at: Time.now)
      end

      def archive(slug:)
        pages.where(slug: slug).update(published_at: nil)
      end
    end
  end
end
