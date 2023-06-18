# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :podcasts do
      primary_key :id
      column :name, :text, null: false
      column :url, :text, null: false
      column :overcast_id, :text, null: false
    end
  end
end
