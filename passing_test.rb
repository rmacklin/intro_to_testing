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

  def test_difference
    x = 1
    assert_difference('x', 2) do
      x += 2
    end
  end

  def test_no_difference
    x = 1
    assert_no_difference('x') do
      x += 1
      x -= 1
    end
  end

  def not_a_test_method
    raise 'the roof'
  end
end
