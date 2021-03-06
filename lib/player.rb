class Scrabble::Player
  attr_accessor :name, :array_words
  attr_reader :player_tiles

  def initialize(name)
    @name = name
    @array_words = []
    @array_of_scores = []
    # @new_draw = Scrabble::TileBag.new
    @bag_tiles = Scrabble::TileBag.new
    @player_tiles = @bag_tiles.draw_tiles(7) #[A:, B:, C:, A:, T:, M:, :O]
  end

  def plays
    return @array_words
    # => ["cat","pull","yes"]
  end

  def play(word) # takes word from player
    # @player_tiles
    @array_words << word
    @player_tiles.pop(word.length)
    # tiles_length = 7 - X
    #4

    @player_tiles += @bag_tiles.draw_tiles(word.length)

    # @new_tiles = @bag_tiles.draw_tiles(@tiles_length)

    # @tiles_length = 7
    # @all_tiles = @player_tiles
    Scrabble::Scoring.score(word)
    # Return to a Numeric
  end

  def total_score
    @array_words.each do |word|
      @array_of_scores << Scrabble::Scoring.score(word)
    end
    # => array_of_scores = [4, 6, 8,]
    return @array_of_scores.reduce(:+)
  end

  def won?
    total_score
    if total_score >= 100
      return true
    else
      return false
    end
  end

  def highest_scoring_word
    Scrabble::Scoring.highest_score_from(@array_words)
  end

  def highest_word_score
    total_score
    pairs = @array_of_scores.zip(@array_words)
    pairs.max[0]
  end

  def tiles
    @player_tiles
  end

end
