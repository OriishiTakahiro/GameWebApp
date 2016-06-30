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
		redirect_to :root, notice: 'マップの生成が完了しました.'
	end

	def edit
	end

	def update
	end

	def destroy
	end

	## --- for API --- ##

	def get_maplist
	end

	def get_mapdata
	end

	def post_report
	end

end
