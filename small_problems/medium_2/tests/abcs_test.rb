require 'minitest/autorun'
require_relative '../abcs.rb'

class AbcsTest < Minitest::Test
  def test_returns_true_for_batch
    expected = true
    actual = block_word?('BATCH')
    assert_equal(expected, actual)
  end

  def test_returns_false_for_butch
    expected = false
    actual = block_word?('BUTCH')
    assert_equal(expected, actual)
  end

  def test_returns_true_for_jest
    expected = true
    actual = block_word?('jest')
    assert_equal(expected, actual)
  end
end
