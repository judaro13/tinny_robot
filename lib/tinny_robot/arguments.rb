module TinnyRobot
  #Class for processing inputs from console
  class Arguments
    COMMANDS = %w(place move left right exit report)
    FACES = %w(north east south west)
    attr_reader :args, :command, :error_msg

    def initialize(args)
      @args = args.downcase.split
      @command = @args.first if @args.size > 0
    end

    COMMANDS.each do |cmd|
      define_method("#{cmd}?") do
        @command == cmd
      end
    end

    #Validate if a string is a number
    def is_i?(string_to_check)
      /\A\d+\z/.match(string_to_check)
    end

    #Validate if the given command is a valid command
    def valid_command?
      unless COMMANDS.include?(@command.to_s)
        @error_msg = %@Invalid command, use:
  -> PLACE X, Y, FACE
  -> MOVE
  -> LEFT
  -> RIGHT
  -> EXIT@
        return false
      end

      reset_error__message
    end

    #Validate if the given params are valid for the board place function
    def valid_place_attributes?
      @error_msg = %@ Invalid command, use:
  -> PLACE X, Y, FACE
  FACE must any of: NORTH, SOUTH, EAST, WEST
  X and Y must be positive integers@

      return false if @args.count != 4

      point_x = clear_i(args[1])
      point_y = clear_i(args[2])
      face = args[3].gsub(",", "").strip

      return false unless is_i?(point_x) && is_i?(point_y) && FACES.include?(face)

      reset_error__message
    end

    def clear_i(arg)
      arg.gsub(/\W/, "").strip
    end

    private
    def reset_error__message
      @error_msg = nil
      true
    end
  end
end
