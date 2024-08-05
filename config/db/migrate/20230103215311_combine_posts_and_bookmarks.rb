# frozen_string_literal: true

ROM::SQL.migration do
  change do
    drop_table :bookmarks
    alter_table :posts do
      add_column :url, :text
      add_column :post_type, :text
    end
  end
end
