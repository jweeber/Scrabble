require_relative './spec_helper'
require_relative '../scrabble'

describe Scrabble::TileBag do
  it "is an object that isn't empty" do
    Scrabble::TileBag.wont_be_nil
  end

  describe "Scrabble::TileBag#draw_tiles(num)" do
    num = [:A, :B, :E, :M, :N, :F, :V]
    game = Scrabble::TileBag.new
    it "should match number of tiles and length of array with random tiles" do
      game.draw_tiles(7).length.must_equal num.length
    end
  end

  
end