require 'minitest/autorun'
require_relative '../staggered_caps2.rb'

class StaggeredCase2Test < Minitest::Test
  def test_staggered_case
    assert_equal('I lOvE lAuNcH sChOoL!',
                 staggered_case('I Love Launch School!'))
    assert_equal('AlL cApS',
                 staggered_case('ALL CAPS'))
    assert_equal('IgNoRe 77 ThE 444 nUmBeRs',
                 staggered_case('ignore 77 the 444 numbers'))
  end

  def test_staggered_case2_count_all_true
    assert_equal('I LoVe lAuNcH ScHoOl!',
                 staggered_case2('I Love Launch School!',
                                 count_all: true))
  end

  def test_staggered_case2_count_all_false
    assert_equal('I lOvE lAuNcH sChOoL!',
                 staggered_case2('I Love Launch School!',
                                 count_all: false))
  end
end
