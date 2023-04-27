
require "rails_helper"


describe "Project Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating product" do
      project = Product.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end
    it "should not be able to save product when title missing" do
      project = Product.new(description: "Some description content goes here")
      expect(project.save).to eq(false)
    end
    it "should be able to save product when have description and title" do
      project = Product.new(title: "Title", description: "Content of the description")
      expect(project.save).to eq(true)
    end
  end
end


describe "Product Attribute Requirements on Edit", :type => :model do
  context "Edit project" do  
    before (:each) do
      @project = Product.create(title: "Title", description: "Content of the description")
 
      end
    it "ensures the title is present when editing project" do
      @project.update(:title => "New Title")
      expect(@project.title == "New Title")
    end
  end
end

