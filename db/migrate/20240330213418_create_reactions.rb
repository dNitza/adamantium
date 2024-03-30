# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :reactions do
      primary_key :id
      foreign_key :post_id, :posts, null: false
      column :visitor_identifier, :text, null: false

      index :post_id
      unique [:post_id, :visitor_identifier]
    end
  end
end
