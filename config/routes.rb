Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	scope '/mapmaker' do

		root to: 'map#index'

		resources :map

		get 'get_maplist', to: 'map#get_maplist'
		get 'get_mapdata', to: 'map#get_mapdata'
		post 'post_report', to: 'map#post_report'

	end

end
