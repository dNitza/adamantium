module Micropub
  module Repos
    class PostRepo < Adamantium::Repo[:posts]
      commands update: :by_pk

      def remove_tag(post_id:, tag:)
        tag = posts.tags.where(label: tag).one

        posts.post_tags.where(post_id: post_id, tag_id: tag[:id]).changeset(:delete).commit if tag
      end

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

      def by_title(title_contains:)
        posts
          .where(post_type: "post")
          .published
          .where(Sequel.ilike(:name, "%#{title_contains}%")).to_a
      end

      def by_content(body_contains:)
        posts
          .where(post_type: "post")
          .published
          .where(Sequel.ilike(:content, "%#{body_contains}%")).to_a
      end

      def slug_exists?(slug)
        !!posts
          .where(slug: slug)
          .one
      end

      def find!(id)
        posts
          .by_pk(id)
          .one!
      end

      def fetch!(slug)
        posts
          .published
          .combine(:tags, :trips, :webmentions)
          .node(:webmentions) { |webmention|
            webmention.where(type: "reply")
          }
          .where(slug: slug)
          .one!
      end

      def fetch_unpublished!(slug)
        posts
          .combine(:tags)
          .where(slug: slug)
          .one!
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

      def auto_tag_post(post_id:, tag_id:)
        return if posts
          .post_tags
          .where(
            post_id: post_id,
            tag_id: tag_id
          ).count > 0

        posts
          .post_tags
          .changeset(:create, {
            post_id: post_id,
            tag_id: tag_id
          })
          .commit
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
