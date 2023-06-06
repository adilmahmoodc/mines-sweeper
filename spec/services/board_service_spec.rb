require 'rails_helper'

RSpec.describe BoardService, type: :service do
  let(:rows) { SecureRandom.rand(0..10) }
  let(:cols) { SecureRandom.rand(0..10) }
  let(:number_of_mines) { SecureRandom.rand(0..10) }

  let!(:board) { create(:board) }

  let!(:board_service) { BoardService.new(rows, cols, number_of_mines, board) }


  context "create board" do
    it "should create board with correct rows and columns" do
      board_service.create
      board = Board.last
      expect(board.mine).not_to be_nil
    end
  end
end
