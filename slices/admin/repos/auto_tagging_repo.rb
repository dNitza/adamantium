module Admin
  module Repos
    class AutoTaggingRepo < Adamantium::DB::Repo[:auto_taggings]
      commands :create

      def find(id)
        auto_taggings
          .where(id: id)
          .map_to(Admin::Entities::AutoTagging)
          .to_a
      end

      def all
        auto_taggings
          .map_to(Admin::Entities::AutoTagging)
          .to_a
      end

      def listing
        auto_taggings
          .combine(:tag)
          .map_to(Admin::Entities::AutoTagging::WithTag)
          .to_a
      end

      def delete(id:)
        auto_taggings
          .where(id: id)
          .delete
      end
    end
  end
end
