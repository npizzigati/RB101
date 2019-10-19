require 'minitest/autorun'
require_relative '../how_long_are_you.rb'

class HowLongTest < Minitest::Test
  def test_word_lengths
    assert_equal(["cow 3", "sheep 5", "chicken 7"], word_lengths("cow sheep chicken"))
    assert_equal(["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"], word_lengths("baseball hot dogs and apple pie"))
    assert_equal(["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"], word_lengths("It ain't easy, is it?"))
    assert_equal(["Supercalifragilisticexpialidocious 34"], word_lengths("Supercalifragilisticexpialidocious"))
  end
end
