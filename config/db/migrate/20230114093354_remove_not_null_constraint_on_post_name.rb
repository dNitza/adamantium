# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :posts do
      set_column_allow_null :name
    end
  end
end
