require 'minitest/autorun'
require_relative '../end_is_near.rb'

class EndIsNearTest < Minitest::Test
  def test_penultimate
    assert_equal('last', penultimate('last word'))
    assert_equal('is', penultimate('Launch School is great!'))
  end

  def test_middle
    assert_equal('last', middle('last'))
    assert_equal('last', middle('last word'))
    assert_equal('School', middle('Launch School is great!'))
    assert_equal('School', middle('This Launch School is great!'))
  end
end
