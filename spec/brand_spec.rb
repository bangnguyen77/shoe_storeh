require("spec_helper")

describe(Brand) do

  it("has many stores") do
    test_store = Store.new({:name => "Portland"})
    test_brand = Brand.new({:name => "Nike"})
    test_brand.stores.push(test_store)
    expect(test_brand.stores()).to(eq([test_store]))
  end

  it("validates the presence of a brand name") do
    test_brand = Brand.new({:name => ""})
    expect(test_brand.save()).to(eq(false))
  end

  it("capitalizes the brand name") do
    test_brand = Store.create({:name => "nike"})
    expect(test_brand.name()).to(eq("Nike"))
  end

end
