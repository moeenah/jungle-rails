require 'rails_helper'

RSpec.feature "Logged in user adds to cart and cart increases by one", type: :feature, js: true do
   # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    # 1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    # end
  end

  scenario "Clicking 'add' button increases cart by one in navbar" do
    # ACT
    visit root_path
    # click_on(class: 'btn btn-default pull-right')
    click_on(class: 'btn btn-primary')
    # page.find(:xpath,"//*[normalize-space()='Details »']").click
    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content(" My Cart (1)")
    expect(page).to have_no_content(" My Cart (0)")
  end
end
