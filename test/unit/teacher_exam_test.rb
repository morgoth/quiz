require 'test_helper'

class TeacherExamTest < ActiveSupport::TestCase
  context "Valid teacher exam" do
    setup do
      teacher = Factory(:teacher)
      @teacher_exam = Factory(:teacher_exam, :teacher => teacher)
      @teacher_exam.teacher_questions << Factory(:teacher_question, :teacher => teacher)
      @teacher_exam.teacher_questions << Factory(:teacher_question, :teacher => teacher)
    end

    should "have question number less or equal to teacher questions size" do
      @teacher_exam.question_number = 2
      assert @teacher_exam.valid?
      @teacher_exam.question_number = 3
      assert !@teacher_exam.valid?
    end

    should "take all questions when question_number is 0" do
      assert @teacher_exam.valid?
      exam = Factory(:exam, :teacher_exam => @teacher_exam)
      assert_equal 2, Question.count
    end

    should "not allow to create with questions not belonging to teacher" do
      @teacher_exam.teacher_questions << Factory(:teacher_question, :teacher => Factory(:teacher))
      assert !@teacher_exam.valid?
    end
  end

  context "Created teacher exam" do
    setup { @teacher_exam = Factory(:teacher_exam) }

    should "not allow to destroy when have exam" do
      Factory(:exam, :teacher_exam => @teacher_exam)
      assert_equal 1, @teacher_exam.exams.count
      assert !@teacher_exam.destroyable?
      assert !@teacher_exam.destroy
    end

    should "allow to destroy when does not have exams" do
      assert @teacher_exam.destroyable?
      assert @teacher_exam.destroy
    end
  end
end
