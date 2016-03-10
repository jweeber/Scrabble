require_relative './spec_helper'
require_relative '../scrabble'


describe Scrabble::Scoring do
  it "is an object that isn't empty" do
    Scrabble::Scoring.wont_be_nil
  end


  describe "Scrabble::Scoring#score" do
    TEST_WORDS = ["yes", "program", "pull", "comma"]



    TEST_WORDS.each do |word|
      it "should return the value as points when given a letter" do
        Scrabble::Scoring.score(word).must_be_kind_of Numeric
      end
    end

    TEST_WORDS.each do |word|
      it "should more than n 50 poins for 7 letter-word" do
        if word.length == 7
          Scrabble::Scoring.score(word).must_be :>, 50
        end
      end
    end

    # TEST_WORDS.each do |word|
    #   it "should raise an error if word is longer than 7 letters" do
    #       if word.length > 7
    #         Scoring.score(word).must_raise ArgumentError("NO")
    #       end
    #   end
    # end

  end

  describe "Scrabble::Scoring#highest_score_from" do
    TEST_ARRAYS = [["cat", "program"], ["dogs", "hotdog"], ["yes", "pull"]]

    TEST_ARRAYS.each do |array|
    it "returns the word from array as a string" do
      Scrabble::Scoring.highest_score_from(array).must_be_instance_of String
    end
    end

      it "should return the shortest word when the score is tied" do
        Scrabble::Scoring.highest_score_from(["yes", "pull", "all"]).must_equal("yes")
      end


  end



end
