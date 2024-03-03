# frozen_string_literal: true

ROM::SQL.migration do
  up do
    execute <<-SQL
     CREATE OR REPLACE FUNCTION update_updated_at_column()
       RETURNS TRIGGER AS $$
         BEGIN
          NEW.updated_at = (now() at time zone 'utc');
          RETURN NEW;
         END;
     $$ language 'plpgsql';
    SQL

    alter_table :pages do 
      add_column :updated_at, :timestamp
    end

    run <<-SQL
      CREATE TRIGGER update_pages_updated_at BEFORE UPDATE
      ON pages FOR EACH ROW EXECUTE PROCEDURE
      update_updated_at_column();
    SQL
  end

  down do
    execute("DROP FUNCTION IF EXISTS update_updated_at_column();")
    
    run <<-SQL
      DROP TRIGGER IF EXISTS update_pages_updated_at ON pages;
    SQL

    alter_table :pages do
      drop_column :updated_at
    end
  end
end
