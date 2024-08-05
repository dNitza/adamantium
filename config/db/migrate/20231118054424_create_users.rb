# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      uuid :id, primary_key: true
      column :email, :text, null: false, unique: true
    end
  end
end
