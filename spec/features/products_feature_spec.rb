require "rails_helper"


RSpec.feature "Products", type: :feature do
    context "Update product" do
      let(:product) { Product.create(item: "Test item", description: "Test content", size: "L", price: 20) }
      before(:each) do
        visit edit_product_path(product)
      end
 
 
      scenario "should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Update Product"
        expect(page).to have_content("Product was successfully updated")
      end
 
 
      scenario "should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Product"
        expect(page).to have_content("Description can't be blank")
      end
    end
end
