# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table(:auto_taggings) do
      primary_key :id
      column :title_contains, :text
      column :body_contains, :text
      foreign_key :tag_id, :tags, null: false
    end
  end
end
