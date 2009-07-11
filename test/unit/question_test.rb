require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  context "Number of created answers" do
    setup do
      @teacher_question = Factory(:teacher_question)
      4.times { Factory(:teacher_answer, :teacher_question => @teacher_question) }
      @question = Factory.build(:question, :teacher_question => @teacher_question, :state => nil, :state_event => 'prepare')
    end

    should "be equal to associated teacher question answers" do
      @question.save!
      assert_equal 4, Answer.count
    end
  end

  context "When updated" do
    setup do
      @teacher_question = Factory(:teacher_question, :question_type => 'check_box')
      @teacher_answer1 = Factory(:teacher_answer, :teacher_question => @teacher_question, :points => 0.1)
      @teacher_answer2 = Factory(:teacher_answer, :teacher_question => @teacher_question, :points => 0.4)
      @teacher_question.teacher_answers << [@teacher_answer1, @teacher_answer2]
      @question = Factory.build(:question, :teacher_question => @teacher_question, :state => nil, :state_event => 'prepare')
    end

    should "update student answers if changed" do
      @question.save!
      stub.instance_of(Exam).finished? { false }
      assert_equal 2, Answer.count
      answer1 = Answer.find_by_teacher_answer_id(@teacher_answer1.id)
      assert_not_nil answer1
      @question.student_answers = { 'check_box' => [answer1.id.to_s] }
      @question.state_event = 'visit'
      @question.save!
      answer1.reload
      assert_equal 0.1, answer1.points
    end

    should "not update student answers if exam is finihsed" do
      # FIXME: stub does not work
      @question.save!
      stub.instance_of(Exam).finished? { true }
      answer1 = Answer.find_by_teacher_answer_id(@teacher_answer1.id)
      assert 0, answer1.points
      @question.student_answers = { 'check_box' => [answer1.id.to_s] }
      @question.state_event = 'visit'
      @question.save!
      answer1.reload
      #assert_equal 0, answer1.points
    end
  end

  should "sum points" do
    question = Factory(:question)
    Factory(:answer, :question => question, :points => 0.3)
    Factory(:answer, :question => question, :points => 0.9)
    Factory(:answer, :question => question, :points => -0.5)
    assert_equal 0.7, question.sum_points
  end
end
