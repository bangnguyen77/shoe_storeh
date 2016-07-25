require("spec_helper")

describe("the stores and each invidual store path", {:type => :feature}) do
  it("shows all the stores") do
    visit("/stores")
    expect(page).to have_content("stores")
  end

  it("adds a new store") do
    visit("/stores")
    fill_in("store_name", :with => "Portland")
    click_button("Add")
    expect(page).to have_content("Portland")
  end

  it("updates a store name") do
    Store.create({:name => "Portland"})
    visit("/stores")
    select("Portland", :from => "update_store_id")
    fill_in("new_name", with: "Landport")
    click_button("Update")
    expect(page).to have_content("Landport")
  end

  it("deletes a store") do
    store = Store.create({:name => "Portland"})
    visit("/stores")
    select("Portland", :from => "delete_store_id")
    click_button("Delete")
    expect(page).to have_content("Stores")
  end

  it("adds a brand to the store") do
    store = Store.create({:name => "Portland"})
    visit("/stores")
    click_link("Portland")
    fill_in("brand_name", with: "nike")
    click_button("Add")
    expect(page).to have_content("Nike")
  end

end
