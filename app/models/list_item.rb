class ListItem < ApplicationRecord
  has_rich_text :description

  validates :title, presence: true
  validates :list_position, numericality: { only_integer: true, greater_than: 0 }

  scope :ordered, -> { order(list_position: :asc) }
end
