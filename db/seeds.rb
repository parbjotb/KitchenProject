require "csv"

Page.delete_all
ProductCategory.delete_all
Category.delete_all
Product.delete_all
Manufacturer.delete_all

filename = Rails.root.join("db/products.csv")

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

    query = URI.encode_www_form_component([product.name, manufacturer.name].join(","))
    downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
    product.image.attach(io:       downloaded_image,
                         filename: "m-#{[product.name,
                                         manufacturer.name].join('-')}.jpg")
    sleep(1)

    if product&.valid?
      # if the product exists and is valid, then we go through the line on the csv
      # and get all the categories and loop through them
      # if we just used the comma, we'll get a SPACE character in there. :(
      # the map(&:string), will take all the values from the split and remove all space characters!
      # The & symbol in this context says: collection.map { | collection_item | collection_item.strip }
      # called a TWO PROC... takes the symbol and turns it into the above!
      # categories = p["category"].split(",").map(&:strip)
      categories = p["category"].split(",").map(&:strip)

      categories.each do |category_name|
        category = Category.find_or_create_by(name: category_name)

        # since the joiner table references the other 2 tables, we can just pass the objects
        ProductCategory.create(product: product, category: category)
      end
    else
      # this is like saying product && product.valid?
      puts "Invalid product #{p['name']}"
    end
  else
    puts "Invalid Manufacturer, #{p['manufacturer']} for product: #{p['name']}"
  end
end

Page.create(
  title:     "Contact Us",
  content:   "Email me at parbjotb@gmail.com if you have any questions about the items",
  permalink: "contact"
)

Page.create(
  title:     "About the Data",
  content:   "What's with all the questions, officer?",
  permalink: "about_the_data"
)
puts "Created #{Manufacturer.count} manufacturers"
puts "Created #{Product.count} products"
puts "Created #{Category.count} categories"
puts "Created #{ProductCategory.count} product categories"
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
