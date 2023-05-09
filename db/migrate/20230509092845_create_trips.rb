# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :trips do
      primary_key :id
      column :name, :text, null: false
      column :start_date, :date, null: false
      column :end_date, :date, null: false
      # column :latitude, :float, null: false
      # column :longitude, :float, null: false
    end
  end
end
