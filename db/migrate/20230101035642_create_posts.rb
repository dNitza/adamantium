# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :posts do
      primary_key :id
      column :name, :text, null: false, default: ""
      column :content, :text, null: false
      column :published_at, :timestamp
    end
  end
end
