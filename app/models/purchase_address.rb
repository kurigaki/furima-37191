class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :shipping_area_id, :municipalities, :address, :building_name, :phone_number, :purchase_record

  # ここにバリデーションの処理を書く
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :building_name
  validates :phone_number, format: {with: /\A\d{10,11}\z/}


  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(price: price, user_id: user_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchase_record: purchase_record)
  end
end