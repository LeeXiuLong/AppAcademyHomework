require "byebug"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    unless self.game_over
      self.round_success_message
      self.sequence_length += 1
    end

  end

  def show_sequence
    self.add_random_color
    self.seq.each {|color| puts color}
  end

  def require_sequence
    puts "type in the correct sequence! be you cant"
    new_arr = self.seq.map {|ele| ele}
    until new_arr.length == 0 || self.game_over == true
      input = gets.chomp
      # debugger
      if input == new_arr[0]
        new_arr.shift
      elsif input != new_arr[0]
        self.game_over = true
      end
    end
  end

  def add_random_color
    colors = ["red", "blue", "yellow", "green"]
    self.seq << colors.sample
  end

  def round_success_message
    puts "Wow I guess you got lucky and guessed it correctly"
  end

  def game_over_message
    puts "Game Over! You Suck!"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end