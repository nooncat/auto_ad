#encoding: UTF-8
require 'spec_helper'

describe "StaticPages" do 

  subject { page }

  describe "Home Pages" do 
    before { visit root_path }

    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "About page" do
    before { visit about_path }
    
    it { should have_selector('h1', text: 'О нас') }
    it { should have_selector('title', text: full_title('О нас')) }
  end
end
