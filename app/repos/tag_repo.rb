module Adamantium
  module Repos
    class TagRepo < Adamantium::Repo[:tags]
      def fetch!(slug)
        tags.where(slug: slug).one!
      end

      def list
        tags
          .order(Sequel.function(:lower, :label))
          .to_a
      end
    end
  end
end
