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
end
