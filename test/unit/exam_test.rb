require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  context "Number of created questions" do
    setup do
      @teacher_exam = Factory(:teacher_exam)
      4.times { @teacher_exam.teacher_questions << Factory(:teacher_question) }
      @exam = Factory.build(:exam, :teacher_exam => @teacher_exam)
    end

    should "be equal to question_number defined in teacher exam" do
      @teacher_exam.question_number = 2
      @teacher_exam.save!
      @exam.save!
      assert 2, Question.all.count
    end

    should "be equal to all teacher questions when question_number is nil" do
      @teacher_exam.question_number = nil
      @teacher_exam.save!
      @exam.save!
      assert 4, Question.all.count
    end
  end
end
