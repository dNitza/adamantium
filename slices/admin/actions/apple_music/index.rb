module Admin
  module Actions
    module AppleMusic
      class Index < Action
        include Deps["views.apple_music.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
