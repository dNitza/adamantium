module Adamantium
  module Entities
    class BookmarkRequest < Dry::Struct
      attribute :h, Types::Coercible::String
      attribute :action, Types::Coercible::String.optional
      attribute :name, Types::Coercible::String
      attribute :cache, Types::Bool.optional
      attribute :content, Types::Coercible::String.optional
      attribute :url, Types::Coercible::String
      attribute :slug, Types::Coercible::String
      attribute :category, Types::Array.of(Types::Coercible::String)
      attribute :published_at, Types::Nominal::DateTime.optional
      attribute :post_type, Types::Coercible::String
      attribute :syndicate_to, Types::Array.of(Types::Coercible::String)
      attribute :photos, Types::Array.of(Types::Hash)
      attribute :location, Types::Coercible::String.optional
    end
  end
end
