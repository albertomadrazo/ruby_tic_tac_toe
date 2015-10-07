require_relative "Board"
require_relative "Validation"
require_relative "Player"

def main
	system("clear")

	board = Board.new
	validate = Validation.new()
	puts "Player one, what's your name? "
	player_1 = Player.new(gets.chomp, 1, "O")

	puts "Player two, what's your name? "
	player_2 = Player.new(gets.chomp, 2, "X")

	system("clear")

	board.draw_board

	player = player_1

	there_is_winner = board.game_status

	until there_is_winner
		chosen_square = validate.square_is_available? player, board.board_array
		board.move(chosen_square, player)
		system("clear")
		board.draw_board

		got_winner = board.sweep_for_winner

		if got_winner == true
			puts "#{player.name} you've won the game!"
			break
		end

		if player == player_1
			player = player_2
		else
			player = player_1
		end
		
		if board.its_a_tie
			puts "It's a tie!"
			puts "Game Over."
			exit
		end
	end
end

main
