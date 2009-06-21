require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  context "valid answer" do
    setup { @answer = Factory.build(:answer) }

    should "have points equal 0 when created" do
      @answer.save!
      assert 0, @answer.points
    end
  end
end
