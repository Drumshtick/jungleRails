require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "clicking add to cart changes counter in nav from 0 to 1" do
    visit root_path

    first(".product > .actions > form > button").click

    expect(page.has_content?("My Cart (1)")).to be_truthy
  end
end
