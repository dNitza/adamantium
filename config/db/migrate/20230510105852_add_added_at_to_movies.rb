# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :movies do
      add_column :watched_at, :date
    end
  end
end
