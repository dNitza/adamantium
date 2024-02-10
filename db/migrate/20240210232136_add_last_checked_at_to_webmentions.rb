# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :webmentions do
      add_column :last_checked_at, :timestamp
    end
  end
end
