require './test_case'

class PassingTest < TestCase 
  def test_the_truth
    assert true == true
  end

  def not_a_test_method
    raise 'the roof'
  end
end
