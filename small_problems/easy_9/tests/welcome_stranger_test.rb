require 'minitest/autorun'
require_relative '../welcome_stranger.rb'

class WelcomeStrangerTest < Minitest::Test
  def test_greetings
    assert_equal('Hello, John Q Doe! Nice to have a Master Plumber around.',
                 greetings(['John', 'Q', 'Doe'], { title: 'Master',
                            occupation: 'Plumber' }))
  end
end
