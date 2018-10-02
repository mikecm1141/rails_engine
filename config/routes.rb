Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
        get '/most_revenue', to: 'top_merchants#index'
      end

			resources :merchants, only: %i[index show] do
        get '/items', to: 'merchants/items#index'
        get '/invoices', to: 'merchants/invoices#index'
      end
      resources :items, only: %i[index show]
      resources :invoices, only: %i[index show]
      resources :invoice_items, only: %i[index show]
      resources :customers, only: %i[index show]
      resources :transactions, only: %i[index show]
		end
	end
end
