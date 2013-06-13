#encoding: UTF-8
require 'spec_helper'

describe "UserPages" do
  
  subject { page }
  
  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1', text: 'Новый пользователь') }
    it { should have_selector('title', text: full_title('Новый пользователь')) }
  end

  describe "signup" do

    before { visit signup_path }

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

        it { should have_selector('div.alert.alert-success', text: 'создан') }
        it { should have_link('Пользователи', href: '#') }
      end
    end
  end
end
