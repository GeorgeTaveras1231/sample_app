require 'spec_helper'

describe "User pages" do
  subject { page }
  describe "signup page" do
    before { visit signup_path }
    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end
  
  describe "profile page" do
    let(:user){FactoryGirl.create(:user)}
    
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
  
  describe "signup page" do
    let(:submit){ "Create my account" }
    before {visit signup_path}
    
    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "password"
        fill_in "Confirmation", with: "password"
      end
      it "should change the user count" do 
        expect {click_button submit}.to change(User,:count).by(1)
      end    
    end
    describe "with invalid information" do
      it "should not change the user count" do
        expect {click_button submit}.not_to change(User,:count)
      end
    end
  end
  
  shared_examples_for "pages with error messages" do
    before 
    describe "should include error messages" do 
      it { should have_content('error') }
      
    end
  end
end