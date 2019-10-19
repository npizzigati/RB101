require 'minitest/autorun'
require_relative '../fizzbuzz.rb'

class FizzbuzzTest < Minitest::Test
  def test_fizzbuzz
    assert_output("1\n2\nFizz\n4\nBuzz\nFizz\n7\n8\nFizz\nBuzz\n11\n" \
                  "Fizz\n13\n14\nFizzBuzz\n") { fizzbuzz(1, 15) }
  end
end
