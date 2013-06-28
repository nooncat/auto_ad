#encoding: UTF-8
require 'spec_helper'

describe "Car pages" do
  subject { page }

  describe "car page" do
    let(:car) { FactoryGirl.create(:car) }
    before { visit car_path(car) }
    
    it { should have_selector('h1', text: car.name) }
    it { should have_selector('title', text: car.name) }
  end
  
  describe "create car page" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user 
      visit compose_path
    end
    
    it { should have_selector('h1', text: 'Создать объявление') }
    it { should have_selector('title', text: 'Создать объявление') }
  end

  describe "create" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit compose_path
    end
    
    let(:submit) { "Создать объявление" }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Car, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Марка автомобиля",    with: "Volga"
        fill_in "Год выпуска", with: "2013"
        fill_in "Цена", with: "100000"
        fill_in "Описание", with: "Cool car"
      end

      it "should create a car" do
        expect { click_button submit }.to change(Car, :count).by(1)
      end
    end
  end
  
  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    let(:car) { FactoryGirl.create(:car) }
    before do
      sign_in user
      visit edit_car_path(car)
    end

    describe "page" do
      it { should have_selector('h1',   text: "Изменить объявление") }
      it { should have_selector('title', text: "Изменить объявление") }
    end

    describe "with invalid information" do
      before do
        fill_in "Марка автомобиля", with: " "
        click_button "Сохранить объявление" 
      end

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name)  { "New_volga" }
      before do
        select "Audi", from: car.name
        fill_in "Год выпуска", with: "2013"
        fill_in "Цена", with: "100000"
        fill_in "Описание", with: "Cool car"
        click_button "Сохранить объявление"
      end
      
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Выйти', href: signout_path) }
      specify { car.reload.name.should == new_name }
    end 
  end
end
  
