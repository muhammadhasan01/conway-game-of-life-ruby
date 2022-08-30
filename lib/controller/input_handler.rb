require './lib/view/board_renderer'

module Conway
  class InputHandler
    ALIVE_CELL = Conway::BoardRenderer::ALIVE_CELL
    DEAD_CELL = Conway::BoardRenderer::DEAD_CELL
    NEW_LINE = "\n".freeze

    def state_from_file(filename)
      cur_x = 0
      cur_y = 0
      alive_cells = Set[]
      File.foreach(filename) do |line|
        line.chars.each do |c|
          unless [ALIVE_CELL, DEAD_CELL, NEW_LINE].include?(c)
            raise StandardError.new, "Invalid character '#{c}' at (#{cur_x}, #{cur_y})"
          end

          alive_cells.add(Conway.cell(cur_x, cur_y)) if c == ALIVE_CELL
          cur_x += 1
        end
        cur_y -= 1
        cur_x = 0
      end
      raise StandardError.new, 'There must be at least one alive cell' if alive_cells.empty?

      alive_cells
    end
  end
end
