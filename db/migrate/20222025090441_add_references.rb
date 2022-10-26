class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :user, foreign_key: { to_table: :users }, index: true
    add_reference :groups, :user, foreign_key: { to_table: :users }, index: true
    add_reference :group_entities, :group, foreign_key: { to_table: :groups }, index: true
    add_reference :group_entities, :entity, foreign_key: { to_table: :entities }, index: true
  end
end
