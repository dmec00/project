require "rails_helper"


RSpec.describe ProductsController, :type => :controller do

    before(:each) do
        user = FactoryBot.create(:user)
        # user.confirm! # Or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
        sign_in user
      end

    let(:valid_attributes) {
        { :item => "Test item!", :description => "This is a test description", :size => "L", :price => 20 }
    }

    let(:valid_session) { {} }

    describe "GET #index" do
        it "returns a success response" do
            Product.create! valid_attributes
            get :index, params: {}, session: valid_session

            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
            # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end

    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end


        context "GET #show" do
            let!(:project) { Product.create(item: "Test item", description: "Test description") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
    end
end

