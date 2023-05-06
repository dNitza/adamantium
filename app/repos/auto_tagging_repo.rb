module Adamantium
  module Repos
    class AutoTaggingRepo < Adamantium::Repo[:auto_taggings]
      def find(id)
        auto_taggings
          .where(id: id)
          .map_to(Adamantium::Entities::AutoTagging)
          .to_a
      end

      def all
        auto_taggings
          .map_to(Adamantium::Entities::AutoTagging)
          .to_a
      end
    end
  end
end
