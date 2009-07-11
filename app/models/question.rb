class Question < ActiveRecord::Base
  acts_as_list :scope => :exam

  has_many :answers, :order => "position", :dependent => :destroy
  belongs_to :exam
  belongs_to :teacher_question

  validates_presence_of :teacher_question, :exam, :state

  delegate :content, :to => :teacher_question

  def sum_points
    answers.map { |a| a.points }.compact.inject { |sum, a| sum += a }
  end

  def student_answers=(value)
    @student_answers = value
  end

  state_machine do
    event :prepare do
      transition nil => :prepared
    end

    event :visit do
      transition [:prepared, :visited] => :visited
    end

    after_transition nil => :prepared, :do => :set_teacher_answers
    after_transition any => :visited, :do => :manage_exam_and_answers
  end

  private

  def manage_exam_and_answers
    exam.try_finish
    set_student_answers unless exam.finished?
  end

  def set_student_answers
    case @student_answers.keys.first
    when 'radio_button', 'check_box'
      answers.each do |answer|
        @student_answers.values.flatten.include?(answer.id.to_s) ? answer.update_attributes(:value => 'true') : answer.update_attributes(:value => 'false')
      end
    when 'text_field'
      answers.first.update_attributes(:value => @student_answers.values.first)
    end
  end

  def set_teacher_answers
    teacher_question.teacher_answers.shuffle.each do |teacher_answer|
      answers.create(:teacher_answer_id => teacher_answer.id, :points => 0)
    end
  end
end
