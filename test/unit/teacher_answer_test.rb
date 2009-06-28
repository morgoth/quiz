require 'test_helper'

class TeacherAnswerTest < ActiveSupport::TestCase
  should "Allow to one answer only if question is text type" do
    teacher_question = Factory(:teacher_question, :question_type => 'text_field')
    teacher_answer = Factory.build(:teacher_answer, :teacher_question => teacher_question)
    assert teacher_answer.save!
    teacher_answer2 = Factory.build(:teacher_answer, :teacher_question => teacher_question)
    teacher_question.reload
    assert !teacher_answer2.valid?
  end

end
