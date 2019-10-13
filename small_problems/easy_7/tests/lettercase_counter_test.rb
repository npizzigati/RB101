require 'minitest/autorun'
require_relative '../lettercase_counter.rb'

class LettercaseCounterTest < Minitest::Test
  def test_letter_case_count
    assert_equal({ lowercase: 5, uppercase: 1, neither: 4 },
                 letter_case_count('abCdef 123'))
    assert_equal({ lowercase: 3, uppercase: 3, neither: 2 },
                 letter_case_count('AbCd +Ef'))
    assert_equal({ lowercase: 0, uppercase: 0, neither: 3 },
                 letter_case_count('123'))
    assert_equal({ lowercase: 0, uppercase: 0, neither: 0 },
                 letter_case_count(''))
  end
end
