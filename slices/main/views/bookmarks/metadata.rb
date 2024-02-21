require "ogpr"

module Main
  module Views
    module Bookmarks
      class Metadata < Main::View
        include Deps["repos.post_repo"]

        config.layout = nil

        expose :description do |og_data|
          og_data.description
        end

        expose :title do |og_data|
          og_data.title
        end

        expose :image do |og_data|
          og_data.image
        end

        private_expose :og_data do |id:|
          url = post_repo.find!(id).url
          Ogpr.fetch(url)
        end
      end
    end
  end
end
