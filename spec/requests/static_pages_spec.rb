#encoding: UTF-8
require 'spec_helper'

describe "StaticPages" do 

  let(:base_title) { "Ваше авто" }

  describe "Home Pages" do 

    it "should have the h1 'Ваше авто'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Ваше авто')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title',
              :text => base_title)
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "About page" do
    
    it "should have the h1 'О нас'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'О нас')
    end

    it "should have the title 'О нас'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                  :text => "#{base_title} | О нас")
    end               
  end
end
