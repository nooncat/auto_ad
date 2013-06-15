#encoding: UTF-8
require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',   text: 'Войти') }
    it { should have_selector('title', text: 'Войти') }
  end
  
  describe "signin" do
    before { visit signin_path }
    
    describe "with invalid information" do
      before { click_button "Войти" }

      it { should have_selector('title', text: 'Войти') }
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

      it { should have_link('Сменить пароль', href: edit_user_path(user)) }
      it { should have_link('Выйти', href: signout_path) }
      it { should have_link('Пользователи',  href: users_path) }

      describe "followed by signout" do
        before { click_link "Выйти" }
        it { should have_link('Войти') }
      end
    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Логин",  with: user.name
          fill_in "Пароль", with: user.password
          click_button "Войти"
        end
        
        describe "after signing in" do

          it "should render the desired protected page" do
            page.should have_selector('title', text: 'Смена пароля')
          end
        end
      end

      describe "in the Users controller" do
        
        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: 'Войти') }
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
      end

      describe "visiting the user index" do
        before { visit users_path }
        it { should have_selector('title', text:  'Войти') }
      end
    end
    
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, name: "wrongname") }
      before { sign_in user }
      
      describe " visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title('Смена пароля')) } 
      end

      describe "submitting a PUT request to the Users#update action" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end
 
    describe "as non_admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }
      
      before { sign_in non_admin }
      
      describe "submitting a DELETE request to the Users#destroy action" do
        before { delete user_path(user) }
        specify { response.should redirect_to(root_path) }
      end
    end  
  end
end
