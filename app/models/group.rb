class Group < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: :user_id

    has_many :group_entities
    has_many :entities, through: :group_entities

    validates :name, presence: true, length: { in: 4..250 }
    validates :icon, presence: true, length: { in: 4..250 }
end
