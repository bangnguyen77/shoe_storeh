require("spec_helper")

describe("the brands and each invidual brand path", {:type => :feature}) do
  it("shows all the brands") do
    visit("/brands")
    expect(page).to have_content("brands")
  end

  it("adds a new brand") do
    visit("/brands")
    fill_in("brand_name", :with => "Nike")
    click_button("Add")
    expect(page).to have_content("Nike")
  end

  it("adds a store selling the brand") do
    brand = Brand.create({:name => "Nike"})
    visit("/brands")
    click_link("Nike")
    fill_in("store_name", with: "Epicodus")
    click_button("Add")
    expect(page).to have_content("Epicodus")
  end

end
