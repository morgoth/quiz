require 'test_helper'

class QuestionHelperTest < ActiveSupport::TestCase
  setup { include QuestionHelper }

  should "return letter hint " do
    value = 'many word answer'
    assert_equal 'xxxx xxxx xxxxxx', generate_hint(value)
  end

  should "return number hint" do
    value = '344'
    assert_equal '###', generate_hint(value)
  end

  should "return letter with number hint" do
    value = '344 word and 666'
    assert_equal '### xxxx xxx ###', generate_hint(value)
  end
end