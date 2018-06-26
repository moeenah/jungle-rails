require 'rails_helper'

RSpec.feature "Visitor clicks on product details button", type: :feature, js: true do
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

  scenario "They are redirected to product details page and can see the product details" do
    # ACT
    visit root_path
    # click_on(class: 'btn btn-default pull-right')
    page.find(:xpath,"//*[normalize-space()='Details »']").click
    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_css 'article.product-detail'
  end
  scenario "Clicking on image or product name redirects user to product details page" do
    # ACT
    visit '/'
    find(:xpath, "//header/a[@href='/products/1']").click
    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_css 'article.product-detail'
  end
end
