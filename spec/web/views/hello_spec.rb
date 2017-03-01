require 'spec_helper'

class TestHello < Minitest::Test
  def setup
  end

  def test_the_truthy
    assert_equal false, true
  end
end
