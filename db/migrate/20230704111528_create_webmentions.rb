# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :webmentions do
      primary_key :id
      column :type, :text, null: false, default: ""

      column :author_name, :text, null: false, default: ""
      column :author_photo, :text, null: false, default: ""
      column :author_url, :text, default: ""

      column :published_at, :timestamp

      column :content_html, :text, null: false, default: ""
      column :content_text, :text, null: false, default: ""

      column :source_url, :text, null: false, default: ""
      column :target_url, :text, null: false, default: ""

      foreign_key :post_id, :posts
    end
  end
end
