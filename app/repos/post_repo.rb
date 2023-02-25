module Adamantium
  module Repos
    class PostRepo < Adamantium::Repo[:posts]
      Sequel.extension :pg_json_ops
      commands update: :by_pk

      def create(post_attrs)
        posts.transaction do
          new_post = posts.changeset(:create, post_attrs).commit

          post_attrs[:category].each do |tag_name|
            next if tag_name == ""

            tag = posts.tags.where(label: tag_name).one ||
              posts
                .tags
                .changeset(:create, {label: tag_name, slug: tag_name.downcase.strip.tr(" ", "-").gsub(/[^\w-]/, "")})
                .commit

            posts.post_tags.changeset(:create, {
              post_id: new_post.id,
              tag_id: tag[:id]
            })
              .commit
          end

          new_post
        end
      end

      def tag_post(post_id:, tags:)
        tags.each do |tag_name|
          next if tag_name == ""

          tag = posts.tags.where(label: tag_name).one ||
            posts
              .tags
              .changeset(:create, {label: tag_name, slug: tag_name.downcase.strip.tr(" ", "-").gsub(/[^\w-]/, "")})
              .commit

          posts.post_tags.changeset(:create, {
            post_id: post_id,
            tag_id: tag[:id]
          })
            .commit
        end
      end

      def remove_tag(post_id:, tag:)
        tag = posts.tags.where(label: tag).one

        posts.post_tags.where(post_id: post_id, tag_id: tag[:id]).changeset(:delete).commit if tag
      end

      def post_listing(limit: nil)
        posts
          .where(post_type: "post", location: nil)
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .limit(limit)
          .to_a
      end

      def photo_listing(limit: nil)
        posts
          .where(post_type: ["post", "checkin"])
          .where(Sequel[:photos].pg_json.array_length > 0)
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .limit(limit)
          .to_a
      end

      def places_listing(limit: nil)
        posts
          .where(post_type: "checkin")
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .limit(limit)
          .to_a
      end

      def bookmark_listing(query: nil)
        base = posts
          .where(post_type: "bookmark")
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))

        query ? base.where(Sequel.ilike(:name, "%#{query}%")).to_a : base.to_a
      end

      def last_location
        posts
          .where(post_type: "checkin")
          .published
          .order(Sequel.desc(:published_at))
          .limit(1)
          .one
      end

      def for_rss
        posts
          .where(post_type: "post", location: nil)
          .exclude(name: nil)
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .to_a
      end

      def fetch!(slug)
        posts
          .published
          .combine(:tags)
          .where(slug: slug)
          .one!
      end

      def find!(id)
        posts
          .by_pk(id)
          .one!
      end

      def slug_exists?(slug)
        !!posts
          .where(slug: slug)
          .one
      end

      def delete!(slug)
        delete_post = posts.where(slug: slug).command(:update)
        delete_post.call(published_at: nil)
      end

      def restore!(slug)
        delete_post = posts.where(slug: slug).command(:update)
        delete_post.call(published_at: Time.now)
      end
    end
  end
end
