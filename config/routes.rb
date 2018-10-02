Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			resources :merchants, only: %i[index show]
      resources :items, only: %i[index show]
      resources :invoices, only: %i[index show]
      resources :invoice_items, only: %i[index show]
      resources :customers, only: %i[index show]
      resources :transactions, only: %i[index show]
		end
	end
end
