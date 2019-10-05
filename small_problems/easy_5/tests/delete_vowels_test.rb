require 'minitest/autorun'
require_relative '../delete_vowels.rb'

class RemoveVowelsTest < Minitest::Test
  def test_remove_vowels
    assert_equal(%w(bcdfghjklmnpqrstvwxyz), remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)))
    assert_equal(%w(grn YLLW blck wht), remove_vowels(%w(green YELLOW black white)))
    assert_equal(['BC', '', 'XYZ'], remove_vowels(%w(ABC AEIOU XYZ)))
  end
end





