require 'minitest/autorun'
require_relative '../staggered_caps.rb'

class StaggeredCapsTest < Minitest::Test
  def test_staggered_case
    assert_equal('I LoVe lAuNcH ScHoOl!',
                 staggered_case('I Love Launch School!'))
    assert_equal('AlL_CaPs',
                 staggered_case('ALL_CAPS'))
    assert_equal('IgNoRe 77 ThE 444 NuMbErS',
                 staggered_case('ignore 77 the 444 numbers'))
  end

  def test_staggered_case2
    assert_equal('I LoVe lAuNcH ScHoOl!',
                 staggered_case2('I Love Launch School!',
                 start: :upper))
    assert_equal('iGnOrE 77 tHe 444 nUmBeRs',
                 staggered_case2('ignore 77 the 444 numbers',
                 start: :lower))
  end
end
