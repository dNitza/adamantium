# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :posts do
      add_column :commentable, :boolean, default: false
    end
  end
end
