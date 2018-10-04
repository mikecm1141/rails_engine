Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
        get '/most_revenue', to: 'top_merchants#index'
        get '/most_items', to: 'most_items#index'
        get '/revenue', to: 'revenue#index'
      end

      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
        get '/most_revenue', to: 'top_items#index'
        get '/most_items', to: 'most_items#index'
      end

      namespace :invoices do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
      end

      namespace :invoice_items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
      end

			resources :merchants, only: %i[index show] do
        get '/items', to: 'merchants/items#index'
        get '/invoices', to: 'merchants/invoices#index'
        get '/revenue', to: 'merchants/revenue#show'
        get '/favorite_customer', to: 'merchants/favorite_customer#show'
      end

      resources :items, only: %i[index show] do
        get '/merchant', to: 'items/merchant#show'
        get '/invoice_items', to: 'items/invoice_items#index'
        get '/best_day', to: 'items/best_day#show'
      end

      resources :invoices, only: %i[index show] do
        get '/transactions', to: 'invoices/transactions#index'
        get '/invoice_items', to: 'invoices/invoice_items#index'
        get '/items', to: 'invoices/items#index'
        get '/customer', to: 'invoices/customer#show'
        get '/merchant', to: 'invoices/merchant#show'
      end

      resources :invoice_items, only: %i[index show] do
        get '/invoice', to: 'invoice_items/invoice#show'
        get '/item', to: 'invoice_items/item#show'
      end

      resources :customers, only: %i[index show]
      resources :transactions, only: %i[index show]
		end
	end
end
