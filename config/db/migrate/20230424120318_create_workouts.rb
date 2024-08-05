# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :workouts do
      primary_key :id
      column :path, :text, null: false
      column :distance, :float, null: false
      column :published_at, :timestamp
    end
  end
end
