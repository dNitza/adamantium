module Admin
  module Views
    module Posts
      class Show < Admin::View
        include Deps["repos.post_repo"]

        expose :post do |id:|
          post_repo.find(id: id)
        end
      end
    end
  end
end
