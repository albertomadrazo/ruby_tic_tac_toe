class Validation

	def initialize 
	end

	def square_is_available? player, array
		chosen_square = ''
		loop do
			print "#{player.name}: Choose a (valid) free square > "
			chosen_square = gets.chomp.to_i
			break if array[chosen_square-1].is_a? Integer and 
						chosen_square > 0 and chosen_square < 10
		end
		chosen_square
	end
end

