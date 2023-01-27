module Adamantium
  module Repos
    class TagRepo < Adamantium::Repo[:tags]
      def fetch!(slug)
        tags.where(slug: slug).one!
      end
    end
  end
end
