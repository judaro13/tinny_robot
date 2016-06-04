require 'readline'
module TinnyRobot
  #Class for play with the tinny robot
  class Play
    def initialize
      @board = Board.new
      @board.print_board
      puts ""
    end

    def start_game
      while line = Readline.readline('> ', true)
        should_continue = process_line(line)
        break unless should_continue
      end
    end

    private
    def process_line(line)
      @args = Arguments.new(line)

      return false if @args.exit?
      unless @args.valid_command?
        puts @args.error_msg
        return true
      end

      if @args.place?
        place_command
      else
        move_command
      end
      true
    end

    def place_command
      args = @args.args
      if @args.valid_place_attributes?
        @board.public_send(@args.command, args[1].to_i, args[2].to_i, args[3])
        puts @board.error_msg
      else
        puts @args.error_msg
      end
    end

    def move_command
      @board.public_send(@args.command)
      puts @board.error_msg
    end
  end
end
