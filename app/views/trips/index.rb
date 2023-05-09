module Adamantium
  module Views
    module Trips
      class Index < View
        include Deps["repos.trip_repo"]

        expose :trips do
          trip_repo.list
        end
      end
    end
  end
end
