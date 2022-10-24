class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :user, foreign_key: { to_table: 'users' }
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
