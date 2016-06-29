Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	scope '/mapmaker' do

		root to: 'map#index'

		resources :map

	end

end
