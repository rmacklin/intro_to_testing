require './test_case'

class FailingTest < TestCase
  def test_the_truth
    assert false == true
  end

  def test_raising
    raise 'the roof'
  end
end
