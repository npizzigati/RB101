require 'minitest/autorun'
require_relative '../spin_me_around.rb'

class SpinMeTest < Minitest::Test
  def test_spin_me
    assert_equal("olleh dlrow", spin_me("hello world"))
  end
end
