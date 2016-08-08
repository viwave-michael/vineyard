Rails.application.routes.draw do
  resources :sensor_data do
    collection do
      post "uplink"
    end
  end
  post "uplink" => "sensor_data#uplink"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
