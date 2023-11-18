# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :login_tokens do
      primary_key :id
      column :user_id, :uuid, null: false
      column :token, :uuid, null: false
      column :created_at, :timestamptz, default: Sequel.lit("now()")
    end
  end
end
