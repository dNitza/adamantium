module Micropub
  module Repos
    class AutoTaggingRepo < Adamantium::DB::Repo[:auto_taggings]
      def find(id)
        auto_taggings
          .where(id: id)
          .map_to(Micropub::Entities::AutoTagging)
          .to_a
      end

      def all
        auto_taggings
          .map_to(Micropub::Entities::AutoTagging)
          .to_a
      end
    end
  end
end
