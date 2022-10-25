class Entity < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: :user_id

    has_many :group_entities
    has_many :groups, through: :group_entities

    validates :name, presence: true, length: { in: 4..250 }
    validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
