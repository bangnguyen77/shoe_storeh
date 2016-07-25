require("bundler/setup")
# require("zlib")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

#show all the stores
get("/stores") do
  @stores = Store.all().order("name")
  erb(:stores)
end

#add a new store
post("/stores") do
  name = params["store_name"]
  Store.create({:name => name})
  redirect back
end

# update a store name
patch('/stores') do
  store_id = params['update_store_id']
  store = Store.find(store_id)
  new_name = params['new_name']
  store.update({:name => new_name})
  redirect back
end

# delete a store
delete('/stores') do
  store_id = params['delete_store_id']
  store = Store.find(store_id)
  store.destroy()
  redirect back
end

# show all the brands
get("/brands") do
  @brands = Brand.all().order("name")
  erb(:brands)
end

# add a new brand
post("/brands") do
  name = params["brand_name"]
  Brand.create({:name => name})
  redirect back
end

# delete a brand
delete('/brands') do
  brand_id = params['delete_brand_id']
  brand = Brand.find(brand_id)
  brand.destroy()
  redirect back
end

# get to an individual store
get('/stores/:id') do
  @store = Store.find(params['id'].to_i)
  @brands = Brand.all()
  @brands = Brand.all() - @store.brands()
  erb(:store)
end

# add a new brand to the individual store
post("/stores/:id/brand/new") do
  name = params['brand_name']
  brand = Brand.create({name: name})
  store_id = params["id"]
  @store = Store.find(store_id)
  @store.brands.push(brand)
  redirect("/stores/#{@store.id}")
end

# add multiple brands to the store
post '/stores/:id/brand' do
  brand_ids = params['brand_ids']
  brand = Brand.find(brand_ids)
  @store = Store.find(params['id'].to_i)
  if !@store.brands.include?(brand)
    @store.brands.push(brand)
  end
  redirect("/stores/#{@store.id}")
end


# get to an individual brand
get '/brands/:id' do
  brand_id = params["id"]
  @brand = Brand.find(brand_id)
  @stores = Store.all()
  erb(:brand)
end

# add a new store to the brand
post("/brands/:id/store/new") do
  name = params['store_name']
  store = Store.create({name: name})
  brand_id = params["id"]
  @brand = Brand.find(brand_id)
  @brand.stores.push(store)
  redirect("/brands/#{@brand.id}")
end

# add multiple stores to the brand
post("/brands/:id/store") do
  store_ids = params['store_ids']
  @brand = Brand.find(params['id'].to_i)
  store_ids.each() do |store_id|
    store = Store.find(store_id)
    if !@brand.stores.include?(store)
      @brand.stores.push(store)
    end
  end
  redirect("/brands/#{@brand.id}")
end
