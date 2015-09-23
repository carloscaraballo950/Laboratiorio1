require_relative 'settings/player'
require_relative 'settings/team'
require_relative 'settings/match'
require_relative 'settings/championship'
require_relative 'utils/form'

class Program

	
	def initialize
		form = Form.new('Ingrese Nombre del Campeonato',
			name: 'Nombre')
		
		form.ask_for(:name)

		form = Form.new('Ingrese cantidad de jugadores')
		number_of_players = form.select_from_list('Elija la cantidad de jugadores para este Torneo', [5, 7, 11])

		@championship = Championship.new(form.get_data[0])
	end

	def championship_can_be_played

		if @team == 0

			p 'No hay equipos para disputar el campeonato'

		elsif @team.players.size % 2 != 0

			p 'La cantidad de equipos disponibles debe ser par'

		else team.players.size < @amount_of_players

			p 'Hay equipos que tienen menos de la cantidad de jugadores requeridos'
					
		end	
	end			

	def championship_start

		remaining_equipments = Array.new(@teams.sort_by{rand})

		@teams.each do |team_a|

			remaining_equipments.delete(team_a)

			remaining_equipments.each do |team_b|

				@matches.push(Match.new(team_a, team_b))

			end	
		end		

		@matches
	
	end

	def championship_name

		@championship.name 
	end

	def add_player

		form = Form.new('Ingrese Informacion del Jugador',
			name: 'Nombre', ci: 'Cedula de identidad')
		
		form.ask_for(:name, :ci)

		player = Player.new(form.get_data[0], form.get_data[1])
		player = @championship.players.push(player)
	end

	def add_team

		if @championship.teams.size < 16
			form = Form.new('Ingrese Informacion del Equipo',
				team: 'Nombre')
			form.ask_for(:team)

			team = Team.new(form.get_data[0])
			teams = @championship.teams.push(team)
		else
			p 'Ya estan todos los equipos ingresados'

		end		
	end

	def add_player_to_team
		form = Form.new("Agregue jugadores a los equipos")

		team = form.select_from_list("Escriba el valor del Equipo al que quiere agregar este jugador", @campionship.teams)
		
		if team.players.size < 5
			
			player = form.select_from_list("Escriba el valor del Jugador que quiere agregar al equipo", @championship.players)
		
			team.players << player
		
		else 

			p 'El equipo ya está completo'	
		end	
	end	

	def display_players
		@championship.players.each { |player| p "#{player.name} (#{player.ci})" }
	end

		
	def display_teams
		@championship.teams.each { |team|  p "#{teams.name} (#{teams.size} jugadores)" }
	end

	def next_match
	end
	
	def display_fixture

		championship_start(teams).each do |match|
			p "#{Match.team_a.name} vs #{Match.team_b.name}"
	end

	def display_teams_players 

		form = Form.new("Elija el equipo que quiera para visualizar los jugadores ")

		team = form.select_from_list("Escriba el valor del Equipo", @teams.players)
	end

	def print_table
	end
end
end
