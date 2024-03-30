module Main
  module Repos
    class ReactionRepo < Adamantium::Repo[:reactions]
      commands :create

      def count(post_id:)
        reactions.where(post_id: post_id).count
      end
    end
  end
end
