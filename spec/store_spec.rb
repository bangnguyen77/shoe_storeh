require("spec_helper")

describe(Store) do
  # it { should have_and_belong_to_many(:brands)}

  it("has many brands") do
    test_store = Store.new({:name => "Portland"})
    test_brand = Brand.new({:name => "Nike"})
    test_store.brands.push(test_brand)
    expect(test_store.brands()).to(eq([test_brand]))
  end

  it("validates the presence of a store name") do
    test_store = Store.new({:name => ""})
    expect(test_store.save()).to(eq(false))
  end

  it("capitalizes the store name") do
    test_store = Store.create({:name => "nike"})
    expect(test_store.name()).to(eq("Nike"))
  end
end
