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
  store.brands.destroy # redundant
  store.destroy
  redirect back
end

#show all the brands
get("/brands") do
  @brands = Brand.all().order("name")
  erb(:brands)
end

#add a new store
post("/stores") do
  name = params["store_name"]
  Store.create({:name => name})
  redirect back
end

#get to an individual store
# get("/stores/:id") do
#   @store = Store.find(params.fetch("id").to_i())
#   @brands = Brand.all()
#   erb(:store)
# end
