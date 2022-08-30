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

    def render_dynamic
      min_x = INF
      max_x = -INF
      min_y = INF
      max_y = -INF
      @alive_cells.each do |x, y|
        min_x = x unless min_x < x
        max_x = x unless max_x > x
        min_y = y unless min_y < y
        max_y = y unless max_y > y
      end
      render_board(min_x - 1, max_x + 1, min_y - 1, max_y + 1)
    end
  end
end
