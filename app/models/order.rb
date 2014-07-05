class Order < ActiveRecord::Base
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
end
