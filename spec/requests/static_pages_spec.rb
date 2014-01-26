require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do
    before :each do
      visit '/static_pages/home'
    end

    it "should have the content 'Sample App'" do
      expect(page).to have_content('Sample App')
    end

    it "should have the title 'Home'" do
      expect(page).to have_title("#{base_title} | Home")
    end
  end

  describe "Help page" do
    
    before :each do
      visit '/static_pages/help'
    end

    it "should have the content 'Help'" do
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  describe "About page" do
    
    before :each do
      visit '/static_pages/about'
    end

    it "should have the content 'About Us'" do
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      expect(page).to have_title("#{base_title} | About Us")
    end
  end

  describe "Contact page" do
    
    before :each do
      visit '/static_pages/contact'
    end

    it "should have the content 'Contact'" do
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      expect(page).to have_title("#{base_title} | Contact")
    end
  end
end