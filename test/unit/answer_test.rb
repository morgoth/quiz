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

  context "when question type is text field, answer" do
    setup do
      teacher_question = Factory(:teacher_question, :question_type => 'text_field')
      teacher_answer = TeacherAnswer.new(:teacher_question => teacher_question)
      teacher_answer.content = "string to match"
      teacher_answer.points = 1
      assert teacher_answer.save
      teacher_question.teacher_answers << teacher_answer
      teacher_exam = Factory(:teacher_exam)
      teacher_exam.teacher_questions << teacher_question
      exam = Factory(:exam, :teacher_exam => teacher_exam)
      @answer = Answer.first
    end

    should "be incorrect when does not match content" do
      assert_equal 1, Answer.count
      @answer.value = "wrong answer"
      @answer.save!
      assert_equal 0, @answer.points
    end

    should "be correct when match content" do
      @answer.value = 'string to match'
      @answer.save!
      assert_equal 1, @answer.points
    end

    should "be correct when match content with ignore case" do
      @answer.value = "String To Match"
      @answer.save!
      assert_equal 1, @answer.points
    end

    should "be incorrect when is empty" do
      @answer.value = ''
      @answer.save!
      assert_equal 0, @answer.points
    end

  end
end
