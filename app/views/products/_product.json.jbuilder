json.extract! product, :id, :item, :description, :size, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
