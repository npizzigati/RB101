require 'minitest/autorun'
require 'byebug'
require_relative '../reversed_arrays.rb'


class ReverseTest < Minitest::Test
  def test_reverse_integers
    expected = [4, 3, 2, 1]
    actual = reverse!([1, 2, 3, 4])
    assert_equal(expected, actual)
  end

  def test_reverse_letters
    expected = %w(c d e b a)
    actual = reverse!(%w(a b e d c))
    assert_equal(expected, actual)
  end

  def test_reverse_single_element
    expected = ['abc']
    actual = reverse!(['abc'])
    assert_equal(expected, actual)
  end

  def test_reverse_object_id
    a = %w(c d e b a)
    expected = a.object_id
    actual = reverse!(a).object_id
    assert_equal(expected, actual)
  end
end
