module Admin
  module Entities
    class AutoTagging < Dry::Struct
      attribute :id, Types::Coercible::Integer
      attribute? :title_contains, Types::Optional::String
      attribute? :body_contains, Types::Optional::String
      attribute :tag_id, Types::Coercible::Integer

      def title_only?
        !title_contains.empty?
      end

      def term
        title_only? ? title_contains : body_contains
      end

      class WithTag < AutoTagging
        attribute :tag, Types::Tag
      end
    end
  end
end
