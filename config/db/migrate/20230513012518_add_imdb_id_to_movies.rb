# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :movies do
      add_column :imdb_id, :text
    end
  end
end
