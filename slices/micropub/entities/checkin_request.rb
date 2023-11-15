module Micropub
  module Entities
    class CheckinRequest < Dry::Struct
      attribute :h, Types::Coercible::String
      attribute :name, Types::Coercible::String.optional
      attribute :content, Types::Coercible::String.optional
      attribute :slug, Types::Coercible::String
      attribute :url, Types::Coercible::String
      attribute :category, Types::Array.of(Types::Coercible::String)
      attribute :published_at, Types::Nominal::DateTime.optional
      attribute :post_type, Types::Coercible::String
      attribute :syndication_sources, Types::Array.of(Types::Coercible::String)
      attribute :photos, Types::Array.of(Types::Hash)
      attribute :location, Types::Coercible::String
    end
  end
end
