require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  context "Number of created questions" do
    setup do
      teacher = Factory(:teacher)
      @teacher_exam = Factory(:teacher_exam, :teacher => teacher)
      4.times { @teacher_exam.teacher_questions << Factory(:teacher_question, :teacher => teacher) }
      @exam = Factory.build(:exam, :teacher_exam => @teacher_exam)
    end

    should "be equal to question_number defined in teacher exam" do
      @teacher_exam.question_number = 2
      @teacher_exam.save!
      @exam.save!
      assert_equal 2, Question.all.count
    end

    should "be equal to all teacher questions when question_number is nil" do
      @teacher_exam.question_number = nil
      @teacher_exam.save!
      @exam.save!
      assert_equal 4, Question.all.count
    end
  end

  context "Exam state" do
    setup do
      teacher = Factory(:teacher)
      @teacher_exam = Factory(:teacher_exam, :duration => 5, :teacher => teacher)
      4.times { @teacher_exam.teacher_questions << Factory(:teacher_question, :teacher => teacher) }
      @exam = Factory.build(:exam, :teacher_exam => @teacher_exam, :state_event => 'prepare')
    end

    should "be prepared when create" do
      @exam.save!
      assert_equal 'prepared', @exam.state
    end

    should "be started when start" do
      @exam.save!
      assert_nil @exam.started_at
      @exam.start
      assert_equal 'started', @exam.state
      assert_not_nil @exam.started_at
    end

    should "be started when try finish and duration not gone beyond" do
      @exam.save!
      @exam.start
      @exam.try_finish
      assert_equal 'started', @exam.state
    end

    should "be finished when try finish and duration gone beyond" do
      @exam.save!
      @exam.start
      @exam.started_at -= 6*60
      @exam.save(false)
      @exam.try_finish
      assert_equal 'finished', @exam.state
    end

    should "be finished when finish" do
      @exam.save!
      @exam.start
      @exam.finish
      assert_equal 'finished', @exam.state
    end

    should "not set started_at when is already started" do
      @exam.save!
      @exam.start
      started_at = @exam.started_at
      @exam.start
      assert_equal started_at, @exam.started_at
      assert_not_equal @exam.started_at, @exam.updated_at
    end

    should "not be started when start date is not a past" do
      @teacher_exam.start_date = (Time.now + 5.minutes)
      @teacher_exam.save!
      @exam.save!
      @exam.start
      assert_not_equal "started", @exam.state
    end

    should "be started when start date is nil" do
      @teacher_exam.start_date = nil
      @teacher_exam.save!
      @exam.save!
      @exam.start
      assert_equal "started", @exam.state
    end
  end
end
