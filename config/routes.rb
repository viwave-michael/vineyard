Rails.application.routes.draw do
  resources :loriots
  resources :sensor_data do
    collection do
      post "uplink"
    end
  end
  post "uplink" => "sensor_data#uplink"
end
