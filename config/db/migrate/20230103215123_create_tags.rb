# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :tags do
      primary_key :id
      column :label, :text, null: false, unique: true
      column :slug, :text, null: false, unique: true
    end

    create_table :post_tags do
      foreign_key :post_id, :posts, null: false
      foreign_key :tag_id, :tags, null: false
    end
  end
end
