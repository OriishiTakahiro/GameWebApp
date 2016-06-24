class Map < ApplicationRecord
	
	@@WIDTH = 15
	@@HEIGHT = 8
	@@PANELS = { -3 => 'rock', -2 => 'jewel', -1 => 'portal' }
	@@WIDTH.freeze; @@HEIGHT.freeze; @@PANELS.freeze;

	def self.WIDTH
		@@WIDTH
	end

	def self.HEIGHT
		@@HEIGHT
	end

	def self.PANELS
		@@PANELS
	end

	def get_filename(i, j)
		file = 'empty.png'
		file = 'start.png' if i == 0 and j == 0
		file = 'goal.png' if i == Map.HEIGHT-1 and j == Map.WIDTH-1
		file
	end

	def get_index(i, j)
		(i == 0 and j == 0) ? 7 : (i == Map.HEIGHT-1 and j == Map.WIDTH-1) ? 8 : 0
	end

end
