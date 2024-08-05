# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :webmentions do
      add_column :retrieval_attempts, :integer, default: 0
    end
  end
end
