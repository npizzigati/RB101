require 'minitest/autorun'
require_relative './test_helper.rb'

require_relative '../madlibs.rb'

include IoTestHelpers

class MadLibsTest < Minitest::Test
  def test_obtain_input_happy_path
    expected = {noun: 'dog', verb: 'walk',
                adj: 'blue', adv: 'quickly'}
    actual = simulate_stdin('dog', 'walk', 'blue', 'quickly') do
               obtain_input
             end
    assert_equal(expected, actual)
  end

  def test_create_madlib
    words = {noun: 'dinner', verb: 'eat',
             adj: 'big', adv: 'tonight'}
    expected = 'I would like to eat a big dinner tonight.'
    actual = create_madlib(words)
    assert_equal(expected, actual)
  end
end
