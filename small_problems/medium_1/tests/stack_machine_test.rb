require 'minitest/autorun'
require_relative '../stack_machine.rb'

class StackMachineTest < Minitest::Test
  def test_mult
    expected = 15
    actual = minilang('5 PUSH 3 MULT')
    assert_equal(expected, actual)
  end

  def test_div
    expected = 3
    actual = minilang('7 PUSH 2 DIV')
    assert_equal(expected, actual)
  end

  def test_mod
    expected = 1
    actual = minilang('7 PUSH 2 MOD')
    assert_equal(expected, actual)
  end

  def test_add
    expected = 10
    actual = minilang('6 PUSH 4 ADD')
    assert_equal(expected, actual)
  end

  def test_sub
    expected = 2
    actual = minilang('6 PUSH 4 SUB')
    assert_equal(expected, actual)
  end

  def test_print
    expected = "10\n"
    assert_output(expected) { minilang('6 PUSH 4 ADD PRINT') }
  end

  def test_represents_integer
    expected = true
    actual = represents_integer?('5')
    assert_equal(expected, actual)
  end

  def test_misc_cases
    assert_equal(0, minilang('PRINT'))
    assert_equal(15, minilang('5 PUSH 3 MULT PRINT'))
    assert_output("5\n3\n8\n") { minilang('5 PRINT PUSH 3 PRINT ADD PRINT') }
  end

  def test_handle_empty_stack
    instructions = '5 MULT'
    assert_output("Stack empty!\n") { minilang(instructions) }
  end

  def test_invalid_token
    instructions = '5 PUSH SAUSAGE PRINT'
    assert_output("Invalid token: 'SAUSAGE'!\n") { minilang(instructions) }
  end
end
