class Board
	attr_accessor :board_array

	def initialize
		@number_of_squares = 9
		@board_array = [1,2,3,4,5,6,7,8,9]
		@square = 0
	end

	def move square, player
		@board_array[square-1] = player.symbol
	end

	def game_status
		false
	end

	def its_a_tie
		@board_array.none?{|x| x.is_a? Integer }
	end

	def vertical(num)
		(num..num+6).step(3)
	end	

	def horizontal(num)
		(num..num+2)
	end

	def diagonal_left(num)
		(num..num+8).step(4)
	end

	def diagonal_right(num)
		(num..num+4).step(2)
	end

	def sweep_for_winner
		temp_array = []
		sweep_type = {  :vertical=>[method(:vertical), [0, 1, 2]], 
						:horizontal=>[method(:horizontal), [0, 3, 6]],
						:diagonal_left=>[method(:diagonal_left), [0]], 
						:diagonal_right=>[method(:diagonal_right), [2]]
					}

		sweep_type.each do |k, v|
			v[1].each do |a|
				v[0].(a).each do |x|
					temp_array << @board_array[x]
				end

				if temp_array.uniq == ["O"] or temp_array.uniq == ["X"]
					return true
				end

				temp_array = []
			end
		end

		return false
	end

	def draw_board
		puts
		puts "        |   |      "
		puts "      #{board_array[0]} | #{board_array[1]} | #{board_array[2]} "
		puts "        |   |      "
		puts "     ___ ___ ___"
		puts "        |   |      "
		puts "      #{board_array[3]} | #{board_array[4]} | #{board_array[5]} "
		puts "        |   |      "
		puts "     ___ ___ ___"
		puts "        |   |      "
		puts "      #{board_array[6]} | #{board_array[7]} | #{board_array[8]} "
		puts "        |   |      "
		puts
	end

end
