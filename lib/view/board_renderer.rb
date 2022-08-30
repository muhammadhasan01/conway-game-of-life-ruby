module Conway
  class BoardRenderer
    TIME_TO_SLEEP_IN_SECONDS = 100
    ALIVE_CELL = '#'.freeze
    DEAD_CELL = ' '.freeze
    INF = 999_999_999

    def initialize(alive_cells)
      @alive_cells = alive_cells
    end

    def render_board(start_x, end_x, start_y, end_y)
      res = ''
      end_y.downto(start_y).each do |y|
        (start_x..end_x).each do |x|
          res += @alive_cells.include?(Conway.cell(x, y)) ? ALIVE_CELL : DEAD_CELL
        end
        res += '\n'
      end
      res
    end
  end
end
