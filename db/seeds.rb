require "csv"

Product.delete_all
Manufacturer.delete_all

filename = Rails.root.join("db/kitchen_products.csv")

puts "Loading products from csv file: #{filename}"

csv_data = File.read(filename)

products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

products.each do |p|
  # puts p["name"]
  # as we create products, we need to have the manufacturer its tied to
  manufacturer = Manufacturer.find_or_create_by(name: p["manufacturer"])

  if manufacturer && manufacturer.valid?
    # create products here
    product = manufacturer.products.create(
      name:        p["name"],
      price:       p["price"],
      description: p["description"]
    )

    # this is like saying product && product.valid?
    puts "Invalid product #{p['name']}" unless product&.valid?
  else
    puts "Invalid Manufacturer, #{p['manufacturer']} for product: #{p['name']}"
  end
end

puts "Created #{Manufacturer.count} manufacturers"
puts "Created #{Product.count} products"
