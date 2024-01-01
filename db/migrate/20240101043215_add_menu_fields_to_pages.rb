# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :pages do
      add_column :main_menu, :boolean, default: false
      add_column :light_colour, :text
      add_column :dark_colour, :text
    end
  end
end
