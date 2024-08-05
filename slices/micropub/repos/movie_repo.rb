module Micropub
  module Repos
    class MovieRepo < Adamantium::DB::Repo[:movies]
      commands :create
    end
  end
end
