# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :top_tracks do
      column :artist, :text
      column :name, :text
      column :url, :text
      column :mb_id, :text # musicbrainz.org ID
      foreign_key :post_id, :posts, null: false, unique: true
    end
  end
end
