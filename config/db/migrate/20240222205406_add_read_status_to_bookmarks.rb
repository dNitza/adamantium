# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :posts do
      add_column :is_read, :bool, default: false
    end
  end
end
