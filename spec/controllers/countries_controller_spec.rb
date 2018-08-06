require 'rails_helper'

RSpec.describe CountriesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "sets the countries instance variable" do 
      get :index
      expect(assigns(:countries)).to eq([])
    end


    it "rendershe index template" do 
      get :index
      expect(response).to render_template(:index)
    end

    it "has countries in the countries instance variable" do
      get :index 
      expect(assignes(:countries).length).to eq(3)
      expect(assigns(:countries).last.name).to eq('name_2')
    end 
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders he new template" do 
      get :new
      expect(response).to render_template(:new)
    end

    it "sets the country instance variable" do 
      get :new
      expect(assigns(:country))).to eq(nil)
    end

  end

  describe "GET #show" do
    it "returns http success" do
      country - Country.create(name: 'name', population: '10', language: 'English')
      get :show, id: country.id
      expect(response).to have_http_status(:success)
    end

    it "render the show template" do 
      country = Country.create(name: 'name', population: '10', language: 'English')
      get :show, id: country.id
      expect(response).to render_template(:show)
    end

    it "set the country instance variable" do 
      country = Country.create(name: 'name', population: '10', language: 'English')
      get :show, id: country.id
      expect(assigns(:country).name).to eq(country.name)
    end

  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do 
  it "sets the country instance variable" do 
    country_params = {country: 
    {
      name: 'test country',
      population: '10',
      language: 'English'
      }
    }
    expect(Country.count).to eq(0)
    post :create, country_params
    expect(Country.count).to eq(1)
    expect(County.first.name).to eq(country_params[:country][:name])
  end

  it "redirect to the show page on success" do 
    country_params = {country:
    {
      name: 'test country',
      population: '10',
      language: 'English'
    }
  }
  post :create, country_params 
  expect(response).to redirect_to(ountry_path(country.first))
  end 

  it "renders new template on fail" do 
    country_params = {country: 
    {
      name: ' ',
      population: '10',
      language: 'English'
    }
  }
  post :create, country_params 
  expect(Country.count).to eq(0)
  expect(esponse).to render_template(:new)
  end

  it "sets the flash success on successful create" do 
    country_params = {country: 
    {
      name: 'test country',
      population: '10',
      language: 'English'
    }
  }
  post :create, country_params 
  expect (flash[:success]).to eq('Country Created')
  end
end

describe "GET #edit" do
   it "returns http success" do
     country = Country.create(name: 'name', population: '10', language: 'English')
     get :edit, id: country.id
     expect(response).to have_http_status(:success)
   end

   it 'renders edit template' do
     country = Country.create(name: 'name', population: '10', language: 'English')
     get :edit, id: country.id
     expect(response).to render_template(:edit)
   end

   it 'sets country instance variable' do
     country = Country.create(name: 'name', population: '10', language: 'English')
     get :edit, id: country.id
     expect(assigns(:country).id).to eq(country.id)
   end
 end

 describe 'PUT #update' do
   it 'sets the country instance variable' do
     country = Country.create(name: 'name', population: '10', language: 'English')
   end

   it 'updates the country' do
     country = Country.create(name: 'name', population: '10', language: 'English')
     put :update, {id: country.id, country: {name: 'new name'}}
     # we need to reload because the country variable is stale
     # reload grabs the most recent attributes out of the data base
     expect(country.reload.name).to eq('new name')
   end

   it 'redirects to the show on success' do
     country = Country.create(name: 'name', population: '10', language: 'English')
   end

   it 'renders the edit template on fail' do
     country = Country.create(name: 'name', population: '10', language: 'English')
   end

   it 'sets the flash success on update' do
     country = Country.create(name: 'name', population: '10', language: 'English')
   end
 end

 describe 'DELETE #destroy' do
   it 'sets the country instance variable' do
     country = Country.create(name: 'name', population: '10', language: 'English')
     delete :destroy, id: country.id
     expect(assigns(:country)).to eq(country)
   end

   it 'destroys the country sucessfully' do
     country = Country.create(name: 'name', population: '10', language: 'English')
     expect(Country.count).to eq(1)
     delete :destroy, id: country.id
     expect(Country.count).to eq(0)
   end

   it 'sets the flash success message' do
     country = Country.create(name: 'name', population: '10', language: 'English')
     delete :destroy, id: country.id
     expect(flash[:success]).to eq('Country deleted!')
   end

   it 'redirects to the index path after destroy' do
     country = Country.create(name: 'name', population: '10', language: 'English')
     delete :destroy, id: country.id
     expect(response).to redirect_to(countries_path)
   end
 end
end


end
