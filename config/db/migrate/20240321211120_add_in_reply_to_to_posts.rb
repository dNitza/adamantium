# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :posts do
      add_column :in_reply_to, :text
    end
  end
end
