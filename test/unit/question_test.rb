require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  context "Number of created answers" do
    setup do
      @teacher_question = Factory(:teacher_question)
      4.times { @teacher_question.teacher_answers << Factory(:teacher_answer) }
      @question = Question.new(:teacher_question => @teacher_question, :exam => Factory(:exam))
    end

    should "be equal to associated teacher question answers" do
      @question.save!
      assert 4, Answer.all.count
    end
  end
end
