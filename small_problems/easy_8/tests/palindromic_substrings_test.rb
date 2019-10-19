require 'minitest/autorun'
require_relative '../palindromic_substrings.rb'

class SubstringsTest < Minitest::Test
  def test_substrings
    assert_equal([ 'a', 'ab', 'abc', 'abcd', 'abcde', 'b', 'bc',
                   'bcd', 'bcde', 'c', 'cd', 'cde', 'd', 'de',
                   'e'], substrings('abcde'))
  end

  def test_palindromes
    assert_equal([], palindromes('abcd'))
    assert_equal(['madam', 'ada'], palindromes('madam'))
    assert_equal(['ll', '-madam-', '-madam-did-madam-', 'madam',
                  'madam-did-madam', 'ada', 'adam-did-mada',
                  'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-',
                  'did', '-madam-', 'madam', 'ada', 'oo'],
                  palindromes('hello-madam-did-madam-goodbye'))
    assert_equal(['nittin', 'itti', 'tt', 'ss', 'settes',
                  'ette', 'tt'], palindromes('knitting cassettes'))
  end

  def test_palindromes2
    assert_equal(['madam', 'ada'], palindromes2('Madam'))
    assert_equal(['nittin', 'itti', 'tt', 'ss', 'settes',
                  'ette', 'tt'], palindromes2('knitting cass-ettes'))
  end
end
