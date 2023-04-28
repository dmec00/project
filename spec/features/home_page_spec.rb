RSpec.feature "HomePages", type: :feature do
    scenario "The visitor should see products" do
      visit root_path
      expect(page).to have_text("Products")
    end
  end
  