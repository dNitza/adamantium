# frozen_string_literal: true

module Admin
  module Actions
    module Posts
      class AddSyndicationSource < Admin::Action
        include Deps["commands.posts.add_syndication_source"]

        def handle(req, res)
          add_syndication_source.call(post_id: req.params[:id],
            source_name: req.params[:syndication_source_name],
            source_url: req.params[:syndication_source_url])

          res.status = 201
          res.headers["HX-Refresh"] = true
        end
      end
    end
  end
end
