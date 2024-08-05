module Micropub
  module Repos
    class WebmentionsRepo < Adamantium::DB::Repo[:webmentions]
      commands :create
    end
  end
end
