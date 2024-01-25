# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table(:movies) do
      add_column :rating, :float, default: 0.0
    end
  end
end
