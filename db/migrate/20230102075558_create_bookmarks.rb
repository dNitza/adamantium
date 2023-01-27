# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :bookmarks do
      primary_key :id
      column :url, :text, null: false
      column :name, :text, null: false
      column :content, :text, null: false, default: ""
      column :published_at, :timestamp
    end
  end
end
