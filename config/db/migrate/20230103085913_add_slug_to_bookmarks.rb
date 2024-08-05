# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :bookmarks do
      add_column :slug, :text, null: false, unique: true
    end
  end
end
