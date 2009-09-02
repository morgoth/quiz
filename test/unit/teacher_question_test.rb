require 'test_helper'

class TeacherQuestionTest < ActiveSupport::TestCase
  context "valid teacher question" do
    setup { @teacher_question = Factory.build(:teacher_question) }

    should "not allowe to change question type" do
      @teacher_question.question_type = 'radio_button'
      assert @teacher_question.save
      @teacher_question.question_type = 'check_box'
      assert !@teacher_question.valid?
      assert @teacher_question.errors.invalid? :question_type
    end
  end

  context "Max points" do
    setup { @teacher_question = Factory.build(:teacher_question, :question_type => 'check_box') }

    should "be calculated" do
      @teacher_question.teacher_answers << Factory(:teacher_answer, :points => 0.3)
      @teacher_question.teacher_answers << Factory(:teacher_answer, :points => -0.8)
      @teacher_question.teacher_answers << Factory(:teacher_answer, :points => 0.2)
      @teacher_question.save!
      assert_equal 0.5, @teacher_question.max_points
    end

    should "include only max value when radiobutton" do
      @teacher_question.question_type = 'radio_button'
      @teacher_question.teacher_answers << Factory(:teacher_answer, :points => 0.6)
      @teacher_question.teacher_answers << Factory(:teacher_answer, :points => -0.8)
      @teacher_question.teacher_answers << Factory(:teacher_answer, :points => 0.2)
      @teacher_question.save!
      assert_equal 0.6, @teacher_question.max_points
    end
  end
end
