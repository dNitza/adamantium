# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :posts do
      add_column :slug, :text, null: false
    end
  end
end
