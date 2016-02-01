require './test_case'

class FailingTest < TestCase
  def test_the_truth
    assert false == true
  end

  def test_failing_with_custom_message
    assert false == true, 'this was supposed to fail anyway'
  end

  def test_equality
    assert_equal true, !true
  end

  def test_equality_with_custom_message
    assert_equal true, !true, 'custom msg yo'
  end

  def test_assert_predicate
    assert_predicate true, :nil?
  end

  def test_refute_predicate
    refute_predicate nil, :nil?
  end

  def test_difference
    x = 1
    assert_difference('x', 2) do
      x += 1
    end
  end

  def test_no_difference
    x = 1
    assert_no_difference('x') do
      x += 1
    end
  end

  def test_raising
    raise 'the roof'
  end
end
