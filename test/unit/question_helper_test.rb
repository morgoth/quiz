require 'test_helper'

class QuestionHelperTest < ActiveSupport::TestCase
  setup { include QuestionHelper }

  should "return letter hint " do
    value = 'many word answer'
    assert_equal 'xxxx xxxx xxxxxx (4 4 6)', generate_hint(value)
  end

  should "return number hint" do
    value = '344'
    assert_equal '### (3)', generate_hint(value)
  end

  should "return letter with number hint" do
    value = '344 word and 666'
    assert_equal '### xxxx xxx ### (3 4 3 3)', generate_hint(value)
  end

  should "change only word characters and numbers" do
    value = "33-1: one, two:"
    assert_equal '##-#: xxx, xxx: (5 4 4)', generate_hint(value)
  end

  should "change polish letters" do
    value = "Żółty wór"
    assert_equal 'xxxxx xxx (5 3)', generate_hint(value)
  end

  should "not change _" do
    value = "some_word "
    assert_equal 'xxxx_xxxx (9)', generate_hint(value)
  end
end