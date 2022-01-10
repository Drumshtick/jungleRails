require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "product can be created with four fields set" do
      @category = Category.create(name: "baked goods")
      @product = Product.create(
        name: "Cookie",
        price_cents: 150,
        quantity: 10000,
        category_id: @category.id
      )
      expect(Product.all.count).to be(1)
    end

    it "product contains name field" do
      @category = Category.create(name: "baked goods")
      @product = Product.create(
        name: "Cookie",
        price_cents: 150,
        quantity: 10000,
        category_id: @category.id
      )
      expect(@product.name).to eq("Cookie")
    end

    it "product contains price field" do
      @category = Category.create(name: "baked goods")
      @product = Product.create(
        name: "Cookie",
        price_cents: 150,
        quantity: 10000,
        category_id: @category.id
      )
      expect(@product.price == 1.50).to be true
    end

    it "product contains quantity field" do
      @category = Category.create(name: "baked goods")
      @product = Product.create(
        name: "Cookie",
        price_cents: 150,
        quantity: 10000,
        category_id: @category.id
      )
      expect(@product.quantity).to eq(10000)
    end

    it "product contains category field" do
      @category = Category.create(name: "baked goods")
      @product = Product.create(
        name: "Cookie",
        price_cents: 150,
        quantity: 10000,
        category_id: @category.id
      )
      expect(@product.category_id).to be_present
    end
  end
end
