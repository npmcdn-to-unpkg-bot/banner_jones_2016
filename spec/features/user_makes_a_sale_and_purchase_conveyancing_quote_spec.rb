require "rails_helper"

feature "User makes a conveyancing sale and sale_and_purchase quote", type: :feature do
  scenario "successfully" do
    visit new_conveyancing_quotes_sale_and_purchase_path

    select "Mr", from: "conveyancing_quotes_sale_and_purchase_title"
    fill_in "conveyancing_quotes_sale_and_purchase_forename", with: "Joe"
    fill_in "conveyancing_quotes_sale_and_purchase_surname", with: "Bloggs"
    fill_in "conveyancing_quotes_sale_and_purchase_phone", with: "01482 482482"
    fill_in "conveyancing_quotes_sale_and_purchase_email", with: "joe.bloggs@example.com"
    select "Now", from: "conveyancing_quotes_sale_and_purchase_timeframe"
    fill_in "conveyancing_quotes_sale_and_purchase_sale_price", with: 100000
    fill_in "conveyancing_quotes_sale_and_purchase_purchase_price", with: 100000
    click_button "Continue"

    within ".conveyancing-quote" do
      expect(page).to have_css ".forename", text: "Joe"
      expect(page).to have_css ".sale-fee", text: "£425.00"
      expect(page).to have_css ".purchase-fee", text: "£450.00"
      expect(page).to have_css ".disbursements .stamp-duty", text: "£0"
    end
  end
end