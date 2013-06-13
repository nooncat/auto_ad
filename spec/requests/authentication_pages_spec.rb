#encoding: UTF-8
require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',   text: 'Вход') }
    it { should have_selector('title', text: 'Вход') }
  end
  
  describe "signin" do
    before { visit signin_path }
    
    describe "with invalid information" do
      before { click_button "Войти" }

      it { should have_selector('title', text: 'Вход') }
      it { should have_selector('div.alert.alert-error', text: 'Неправильная') }
      describe "after visiting another page" do
        before { click_link "Главная" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Логин", with: user.name.upcase
        fill_in "Пароль", with: user.password
        click_button "Войти"
      end

      it { should have_link('Настройки', href: '#') }
      it { should have_link('Выход', href: signout_path) }

      describe "followed by signout" do
        before { click_link "Выход" }
        it { should_not have_link('Выход') }
      end
    end
  end
end
