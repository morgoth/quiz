require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  context "Number of created answers" do
    setup do
      @teacher_question = Factory(:teacher_question)
      4.times { Factory(:teacher_answer, :teacher_question => @teacher_question) }
      @question = Factory.build(:question, :teacher_question => @teacher_question)
    end

    should "be equal to associated teacher question answers" do
      @question.save!
      assert_equal 4, Answer.all.count
    end
  end

  context "When updated" do
    setup do
      @teacher_question = Factory(:teacher_question, :question_type => 'check_box')
      @teacher_answer1 = Factory(:teacher_answer, :teacher_question => @teacher_question, :points => 0.1)
      @teacher_answer2 = Factory(:teacher_answer, :teacher_question => @teacher_question, :points => 0.4)
      @teacher_answer3 = Factory(:teacher_answer, :teacher_question => @teacher_question, :points => -0.1)
      @teacher_question.teacher_answers << [@teacher_answer1, @teacher_answer2, @teacher_answer3]
      @question = Factory.build(:question, :teacher_question => @teacher_question)
    end

    should "update answers value if changed" do
      @question.save!
      assert_equal 3, Answer.count
      answer1 = Answer.find_by_teacher_answer_id(@teacher_answer1.id)
      answer2 = Answer.find_by_teacher_answer_id(@teacher_answer2.id)
      assert_not_nil answer1
      @question.update_answers = { 'check_box' => [answer1.id.to_s] }
      answer1.reload
      @question.update_answers = { 'check_box' => [answer2.id.to_s] }
      answer1.reload
      answer2.reload
      assert_equal 0, answer1.points
      assert_equal @teacher_answer2.points, answer2.points
    end

  end
end
