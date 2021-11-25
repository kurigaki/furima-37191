class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_area
  belongs_to :shipping_cost
  belongs_to :shipping_time

  validates :image, presence: true
  def was_attached?
    self.image.attached?
  end
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_area_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_time_id, numericality: { other_than: 1 , message: "can't be blank"}

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    presence: { message: "can't be blank"}
  end
end
