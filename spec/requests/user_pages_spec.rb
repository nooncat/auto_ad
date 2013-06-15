#encoding: UTF-8
require 'spec_helper'

describe "UserPages" do
  
  subject { page }
  
  describe "index" do
    
    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      sign_in user
      visit users_path
    end

    it { should have_selector('title', text: 'Пользователи') }
    it { should have_selector('h1',    text: 'Пользователи') }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all)  { User.delete_all }

      it { should have_selector('div.pagination') }
      
      it "should list each user" do
        User.paginate(page: 1).each do |user|
          page.should have_selector('li', text: user.name)
        end
      end
    end
    
    describe "delete links" do
      
      it { should_not have_link('удалить') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end
        
        it { should have_link('удалить', href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect { click_link('удалить') }.to change(User, :count).by(-1)
        end
        it { should_not have_link('удалить', href: users_path(admin)) }
      end
    end
  end
  
  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1', text: 'Новый пользователь') }
    it { should have_selector('title', text: full_title('Новый пользователь')) }
  end

  describe "signup" do
    
    let(:admin) { FactoryGirl.create(:admin) }
    
    before do
      sign_in admin
      visit signup_path
    end

    let(:submit) { "Создать пользователя" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Логин",         with:  "Example User"
        fill_in "Пароль",        with: "foobar"
        fill_in "Подтверждение", with: "foobar"
      end
      
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.fing_by_name('Example User') }

        it { should have_selector('div.alert.alert-success', text: 'создан')  }
      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_selector('h1', text: "Смена пароля") }
      it { should have_selector('title', text: "Смена пароля") }
    end
    
    describe "with invalid information" do
      before { click_button "Сохранить" }

      it { should have_content('error') }
    end
  end
end
