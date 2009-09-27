class Answer < ActiveRecord::Base
  acts_as_list :scope => :question

  belongs_to :question
  belongs_to :teacher_answer
  has_many :answers

  validates_presence_of :question, :teacher_answer

  before_update :calculate_points
  before_destroy :destroyable?

  delegate :content, :to => :teacher_answer

  def destroyable?
    answers.empty?
  end

  private

  def calculate_points
    case question.teacher_question.question_type
    when 'check_box', 'radio_button'
      self.points = value == 'true' ? teacher_answer.points : 0
    when 'text_field'
      if value.empty?
        self.points = 0
      else
        self.points = levenshtein_match? ? teacher_answer.points : 0
      end
    end
  end

  def levenshtein_match?
    # number 6 is taken from polish nerd quiz
    distance = Levenshtein.distance(teacher_answer.content.downcase, value.downcase)
    teacher_answer.content.gsub(/\s/,'').length / 6 >= distance
  end
end
