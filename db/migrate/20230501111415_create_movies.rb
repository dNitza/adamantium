# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :movies do
      primary_key :id
      column :title, :text, null: false
      column :year, :integer
      column :url, :text, null: false
    end
  end
end
