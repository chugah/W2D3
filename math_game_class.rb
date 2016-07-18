require 'colorize'

class Player
  attr_accessor :life
  attr_reader :name

  def initialize(name="")
	@name = name
	@life = 3
  end
end


def generate_q(name)
#This one takes the string name of player and returns the answer of the problem
#Structure of q: num1, num2, operator, result
	q = [rand(20).to_i,rand(20).to_i,rand(4).to_i,0]
	case q[2]
	when 0
		q[3] = q[0] + q[1]
		q[2] = "+"
	when 1
		q[3] = q[0] - q[1]
		q[2] = "-"
	when 2
		q[3] = q[0] * q[1]
		q[2] = "*"
	when 3
		q[3] = q[0] / q[1]
		q[2] = "/"
	end

	puts "\n-----------------------------------------"
	puts "#{name.yellow}, it's your turn."
	puts "What is #{q[0]} #{q[2]}  #{q[1]} = ?".magenta
	return q[3]
return 
#####==== Question is returned in an array of two integers
end

def verify_ans(correct,user)
	correct == user
end

def play(player)
	#This method takes a player object and finished from generating question to deduct life
	q = generate_q(player.name)
	ans = gets.chomp.to_i

	unless verify_ans(q,ans)
		#This is when the player screwed up
		player.life -= 1
		puts "Unfortuantely #{player.name.red}, that's not the right answer."
		return false
		#THIS METHOD WILL RETURN FALSE WHEN A LIFE IS DEDUCTED FROM A PLAYER
	end	
return true
end

def game_over(name)
	### This method takes the player's name as input ,string required
	puts "#{name}, you've lost all your lives!!!! \n\n"
	puts "GAME OVER".red
end

def display_life(plr_arr)
### This method takes an array of player object
### First it will check if any lost,and if any lost,print they lost and return false
### Otherwise, print out their name and lives left and return true

	plr_arr.each do |plr| 
		if plr.life == 0
		game_over(plr.name)
		puts "Do you want to restart the game? (Yes/no)".green
		ans = gets.chomp.downcase
		return false unless ans == "yes"
		plr_arr.each {|a| a.life = 3}
		return true
		end
	end

	plr_arr.each {|plr| print "#{plr.name} has #{plr.life} lives left.".light_green}
	print "\n\n"
	return true
end



def main
	player_arr = []
	2.times do
		print "Please enter your name: "
		name = gets.chomp
		player_arr << Player.new(name)
	end

	while true
	player_arr.each do |player|
		if play(player) == false
			return unless display_life(player_arr)
		end
	end
	end
end

main()