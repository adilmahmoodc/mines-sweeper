class BoardsController < ApplicationController
  before_action :set_board, only: %i[show update destroy]

  # GET /boards or /boards.json
  def index
    @boards = Board.all
    @boards = @boards.order('created_at desc').limit(10) if params[:view_all].blank?
  end

  # GET /boards/1 or /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # POST /boards or /boards.json
  def create
    board = Board.new(board_params)
    rows = board_params[:width].to_i
    cols = board_params[:height].to_i
    number_of_mines = board_params[:number_of_mines].to_i

    BoardService.new(rows, cols, number_of_mines, board).create

    redirect_to board_url(board)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.require(:board).permit(:name, :email, :width, :height, :number_of_mines)
    end
end
