# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :posts do
      add_column :location, :text, default: nil
    end
  end
end
