# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :workouts do
      add_column :duration, :float, null: false
    end
  end
end
