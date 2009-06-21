require 'test_helper'

class TeacherExamTest < ActiveSupport::TestCase
  context "Valid teacher exam" do
    setup { @teacher_exam = Factory(:teacher_exam) }

    should "have question number less or equal to teacher questions size" do
      @teacher_exam.teacher_questions << Factory(:teacher_question)
      @teacher_exam.teacher_questions << Factory(:teacher_question)
      @teacher_exam.question_number = 2
      assert @teacher_exam.valid?
      @teacher_exam.question_number = 3
      assert !@teacher_exam.valid?
    end
  end
end
