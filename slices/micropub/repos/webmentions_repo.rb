module Micropub
  module Repos
    class WebmentionsRepo < Adamantium::Repo[:webmentions]
      commands :create
    end
  end
end
