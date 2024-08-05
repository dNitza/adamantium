# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :post_trips do
      foreign_key :post_id, :posts, null: false
      foreign_key :trip_id, :trips, null: false
    end
  end
end
