module Micropub
  module Entities
    class BookRequest < Dry::Struct
      attribute :h, Types::Coercible::String
      attribute :content, Types::Coercible::String
      attribute :book_status, Types::Coercible::String
      attribute :name, Types::Coercible::String
      attribute :book_author, Types::Coercible::String
      attribute :slug, Types::Coercible::String
      attribute :category, Types::Array.of(Types::Coercible::String)
      attribute :published_at, Types::Nominal::DateTime
      attribute :post_type, Types::Coercible::String
    end
  end
end
