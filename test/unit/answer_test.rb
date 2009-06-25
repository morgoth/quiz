require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  context "valid answer" do
    setup { @answer = Factory.build(:answer) }

    should "have points equal nil when created" do
      @answer.save!
      assert_nil @answer.points
    end

    should "have points equal to teacher_answer points when value on update is true" do
      points = @answer.teacher_answer.points
      @answer.save!
      @answer.value = 'true'
      assert @answer.save
      assert_equal points, @answer.points
    end

    should "set points to 0 when value is false" do
      points = @answer.teacher_answer.points
      @answer.save!
      @answer.value = 'true'
      @answer.save!
      assert_equal points, @answer.points
      @answer.value = 'false'
      @answer.save!
      assert_equal 0, @answer.points
    end

  end
end
