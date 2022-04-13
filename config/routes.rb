Rails.application.routes.draw do
  resources :restaurants
  devise_for :users
  root to: 'pages#home'
  get '/tagged', to: "restaurants#tagged", as: :tagged

# app/controllers/restaurants_controller.rb
  def tagged
    if params[:tag].present?
      @restaurants = Restaurant.tagged_with(params[:tag])
    else
      @restaurants = Restaurant.all
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
