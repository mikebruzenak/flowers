json.array!(@orders) do |order|
  json.extract! order, :id, :customer_name, :email, :delivery_method
  json.url order_url(order, format: :json)
end
