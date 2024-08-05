# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :posts do
      add_column :book_status, :text, default: nil
      add_column :book_author, :text, default: nil
    end
  end
end
