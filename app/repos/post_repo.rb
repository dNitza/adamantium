module Adamantium
  module Repos
    class PostRepo < Adamantium::Repo[:posts]
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

      def post_listing(limit: nil)
        posts
          .where(post_type: "post")
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

      def for_rss
        posts
          .where(post_type: "post")
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
