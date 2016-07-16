class MapController < ApplicationController

	## --- for View --- ##

	def index
		@maps = Map.page(params[:page]).per(10).order('updated_at desc')
	end

	def new
		@map = Map.new
	end

	def create
		maphash = params[:map]
		#render text: maphash.keys.map { |key| "#{key}, #{maphash[key]}" }
		Map.create!( name: maphash[:name], creater: maphash[:creater], map_data: maphash[:map_data] )
		redirect_to :root, notice: 'New map is saved on server !'
	end

	def edit
	end

	def update
	end

	def destroy
		tmp = Map.find_by(id: params[:id])
		tmp.destroy if(not tmp.nil?)
		redirect_to :root
	end

	## --- for API --- ##

	def get_maplist
		mapdat = Map.all
		render json: mapdat.map{ |e| { id: e.id, name: e.name, cleared: e.cleared, min_cost: e.min_cost ,created_at: e.created_at }}
	end

	def get_mapdata
		render json: Map.find_by(id: params[:id]).map_data
	end

	def post_report
		map = Map.find_by(id: params[:id])
		if(not map.nil?) then
			map.min_cost = params[:cost].to_i if(map.min_cost.nil? or map.min_cost > params[:cost].to_i)
			map.cleared += 1
			map.save
			render text: :succeeded
		else
			render text: :failed
		end
	end

end
