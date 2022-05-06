class ListItem < ApplicationRecord
  has_rich_text :description

  validates :title, presence: true
  validates :list_position, numericality: { only_integer: true, greater_than: 0 }

  scope :ordered, -> { order(list_position: :asc) }

  after_commit :broadcast_list_items

  private

  def broadcast_list_items
    broadcast_replace_to(
      :funky_list_items,
      target: "list_items",
      partial: "list_items/list_items",
      locals: {
        list_items: ListItem.ordered
      }
    )
  end
end
