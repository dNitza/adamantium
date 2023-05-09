module Admin
  module Repos
    class PostTripRepo < Adamantium::Repo[:post_trips]
      commands :create
    end
  end
end
