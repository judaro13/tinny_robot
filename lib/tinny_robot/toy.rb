module TinnyRobot
  #class to describe a toy robot
  class Toy
    FACES = %w(north east south west)
    MIN_LEFT = 0
    MAX_RIGHT = 3

    attr_reader :face

    def initialize
      @face = FACES[0] # default value
    end

    def face=(face)
      check_face(face)
      @face = face
    end

    #Rotate a toy to the left
    def left
      index = FACES.find_index(@face)
      if index > MIN_LEFT
        @face = FACES[index-1]
      else
        @face = FACES[3]
      end
    end

    #Rotate a toy to the right
    def right
      index = FACES.find_index(@face)
      if index < MAX_RIGHT
        @face = FACES[index+1]
      else
        @face = FACES[0]
      end
    end

    #Validate if a face is a cardinal point
    def check_face(face)
      raise StandardError, 'Wrong face choose between north, south, west, east' unless FACES.include?(face)
    end
  end
end
