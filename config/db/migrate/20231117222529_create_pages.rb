# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :pages do
      primary_key :id
      column :name, :text, null: false
      column :content, :text, null: false
      column :slug, :text, null: false
      column :published_at, :date

      index :slug, unique: true
    end
  end
end
