class Shipping < ApplicationRecord
  belongs_to :order
  # include ActiveModel::Model
  # attr_accessor :token, :user_id, :item_id, :postal_code, :area_id, :municipalities, :house_number, :building_name, :phone_number, :price

  # validates :user_id, presence: true
  # validates :item_id, presence: true
  # validates :postal_code, presence: true
  # validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' },allow_blank: true
  # validates :area_id, presence: true
  # validates :area_id, numericality: { other_than: 1, message: "can't be blank" },allow_blank: true
  # validates :municipalities, presence: true
  # validates :house_number, presence: true
  # validates :phone_number, presence: true
  # validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' },allow_blank: true
  # validates :token, presence: true

  # def save
  #   order = Order.create(user_id: user_id, item_id: item_id)
  #   Shipping.create(order_id: order.id, postal_code: posal_code, area_id: area_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number)
  # end
end
