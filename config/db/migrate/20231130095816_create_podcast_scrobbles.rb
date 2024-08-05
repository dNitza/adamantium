# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :podcast_scrobbles do
      primary_key :id
      column :overcast_id, :text
      column :podcast_name, :text
      column :title, :text
      column :url, :text
      column :enclosure_url, :text
      column :listened_at, :date

      index :overcast_id
    end
  end
end
