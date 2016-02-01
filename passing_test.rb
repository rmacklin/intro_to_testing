require './test_case'

class PassingTest < TestCase 
  def test_the_truth
    assert true == true
  end

  def test_equality
    assert_equal false, !true
  end

  def test_assert_predicate
    assert_predicate nil, :nil?
  end

  def test_refute_predicate
    refute_predicate true, :nil?
  end

  def not_a_test_method
    raise 'the roof'
  end
end
