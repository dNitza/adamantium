module Admin
  module Actions
    class Index < Action
      include Deps["views.index"]

      def handle(req, res)
        res.render index
      end
    end
  end
end
