require './test_case'

class MixedTest < TestCase 
  def test_the_truth
    assert true == true
  end

  def test_not_the_truth
    assert false == true
  end

  def test_more_truth
    assert 5 == 5
  end
end
