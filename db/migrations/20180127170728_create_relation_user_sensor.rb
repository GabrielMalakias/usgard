Hanami::Model.migration do
  up do
    alter_table(:sensors) do
      add_foreign_key :user_id, :users
    end
  end

  down do
    alter_table(:sensors) do
      drop_foreign_key :user_id
    end
   end
end

