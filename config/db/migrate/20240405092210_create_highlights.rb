# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :highlights do
      primary_key :id
      foreign_key :post_id, :posts, null: false
      column :text, :text, null: false

      index :post_id
    end
  end
end
