module Adamantium
  module Entities
    class AutoTagging < Dry::Struct
      attribute? :title_contains, Types::Optional::String
      attribute? :body_contains, Types::Optional::String
      attribute :tag_id, Types::Coercible::Integer

      def title_only?
        !title_contains.empty?
      end
    end
  end
end
