module Micropub
  module Repos
    class MovieRepo < Adamantium::Repo[:movies]
      commands :create
    end
  end
end
