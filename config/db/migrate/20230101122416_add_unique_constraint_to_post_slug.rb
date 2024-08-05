# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :posts do
      add_unique_constraint :slug
    end
  end
end
