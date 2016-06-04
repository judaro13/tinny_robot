module TinnyRobot
  #Class to describe the play board
  class Board
    # @point: Toy position
    # @board_array: Board
    # @size: Board size
    # @toy: current toy
    attr_reader :toy
    FACE_MAP = {
      "north" => "^",
      "south" => "v",
      "east" => ">",
      "west" => "<"
    }
    attr_reader :error_msg

    def initialize(size=5)
      @size = size
      clear_board
    end

    # Clear the board
    def clear_board
      @board_array = Array.new(@size)
      @board_array.each_with_index { |value,index| @board_array[index] = Array.new(@size) }
    end

    #Create or Update a toy
    def create_or_update_toy(face)
      @toy ||= Toy.new
      @toy.face = face
    end

    #Place the toy in the board
    def place(point_x, point_y, face)
      return unless valid_position?(point_x, point_y)
      create_or_update_toy(face)
      @point = Point.new(point_x,point_y)
      set_movement
    end

    #Move the toy in the board
    def move
      return unless toy_exist?
      move_to_next_spot
      set_movement
    end

    #Change the toy position to the next faced spot
    def move_to_next_spot
      face = @toy.face
      point_x = @point.x
      point_y = @point.y

      case face
      when "north"
        point_y += 1
      when "south"
        point_y -= 1
      when "east"
        point_x += 1
      else
        point_x -= 1
      end

      return unless valid_position?(point_x, point_y)

      @point.x = point_x
      @point.y = point_y
    end

    #Send rotate toy to the left
    def left
      rotate(:left)
    end

    #Send rotate toy to the right
    def right
      rotate(:right)
    end

    #Send the movement action to the toy
    def rotate(direction)
      return unless toy_exist?
      @toy.public_send(direction)
      set_movement
    end

    #Apply the last action to the board
    def set_movement
      clear_board
      @board_array[@size-@point.y-1][@point.x] = FACE_MAP[@toy.face]
      print_board
    end

    #Print the current state of the board and toy
    def report
      return unless toy_exist?
      print_board
      puts ''
      puts "#{@point.x}, #{@point.y}, #{@toy.face.upcase}"
    end

    #Print the board
    def print_board
      puts "_"*@size*3
      @board_array.each do |rows|
        p_row = "|"
        rows.each do |row|
          unless row
            p_row += "_"*2
          else
            p_row += "#{row}_"
          end
          p_row += "|"
        end
        puts p_row
      end
    end

    #Validate a coordenate in the board
    def valid_position?(point_x,point_y)
      unless point_x >= 0 && point_x < @size && point_y >= 0 && point_y < @size
        @error_msg = "Invalid position #{point_x}, #{point_y}"
        return false
      end

      @error_msg = nil
      true
    end

    #Validate the existence of a toy
    def toy_exist?
      unless @toy
        @error_msg = "The first action must be place the toy\n-> PLACE X,Y,FACE"
        return false
      end

      @error_msg = nil
      true
    end
  end
end
