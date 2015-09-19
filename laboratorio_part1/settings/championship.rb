class Championship
	attr_accessor :name, :teams, :players, :matches

	def initialize(name)
		@name = name
		@players = []
		@teams = []
		@matches = []
		@finished = false
	end

	
end
