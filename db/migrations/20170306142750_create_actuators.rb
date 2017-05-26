Hanami::Model.migration do
  change do
    execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'

    create_table :actuators do
      primary_key :id

      column :name,         String
      column :description,  String
      column :topic,        String
      column :type,         String
      column :visible,      TrueClass

      column :token, 'uuid', null: false, default: Hanami::Model::Sql.function(:uuid_generate_v4)

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
