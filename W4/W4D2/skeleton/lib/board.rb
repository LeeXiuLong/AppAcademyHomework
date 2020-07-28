class Board

  require "byebug"
  attr_accessor :cups, :player1, :player2

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14){Array.new(0)}
    self.place_stones
  end

  def place_stones
    @cups.each_with_index do |cup,i|
      if i != 13 && i != 6 
        4.times do
          cup << :stone
        end
      end
    end 
  end

  def valid_move?(start_pos)
    unless start_pos >= 0 && start_pos < 14
      raise "Invalid starting cup"
    end
    unless self.cups[start_pos].length > 0
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    num_stones = self.cups[start_pos].length
    self.cups[start_pos] = []
    if current_player_name == self.player1
      lower = true
    else
      lower = false
    end
    i = 1
    while num_stones > 0
      current_pos = (start_pos + i) % 14
      if (lower == false && current_pos == 6) || (lower == true && current_pos == 13)
        i += 1
        next
      else
        self.cups[current_pos] << :stone
        num_stones -= 1
      end
      i += 1
    end
    self.render
    self.next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 13 || ending_cup_idx == 6
    return :switch if self.cups[ending_cup_idx].length <= 1
    return ending_cup_idx if self.cups[ending_cup_idx].length > 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if self.cups[0..5].all? {|cup| cup.length == 0} || self.cups[7..12].all? {|cup| cup.length ==0 }
    false
  end

  def winner
    case self.cups[13].length <=> self.cups[6].length
    when 0
      return :draw
    when 1
      return self.player2
    when -1
      return self.player1
    end
  end
end
