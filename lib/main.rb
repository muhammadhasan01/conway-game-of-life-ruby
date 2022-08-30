require './lib/controller/game'

module Conway
  class Main
    MAX_ITERATE_NUM = 1_000_000_000
    TIME_TO_SLEEP_IN_SECONDS = 0.1

    def initialize
      @alive_cells = Set[]
    end

    def print_screen(args)
      print(args)
      $stdout.flush
    end

    def build_from_input
      is_input_valid = false
      until is_input_valid
        print_screen 'Input the filename path: '
        filename = gets.chomp
        input_handler = InputHandler.new
        begin
          @alive_cells = input_handler.state_from_file(filename)
          is_input_valid = true
        rescue StandardError => e
          puts e.message
        end
      end
    end

    def simulate
      MAX_ITERATE_NUM.times do |num|
        puts "Board at iteration-#{num}:"
        renderer = Conway::BoardRenderer.new(@alive_cells)
        board = renderer.render_dynamic
        board.chars.each do |c|
          if c == 'n'
            puts
          elsif c != '\\'
            print_screen(c)
          end
        end

        @alive_cells = Conway::Game.new.next_state(@alive_cells)

        sleep(TIME_TO_SLEEP_IN_SECONDS)
      end
    end

    def play
      build_from_input
      simulate
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  main = Conway::Main.new
  main.play
end
