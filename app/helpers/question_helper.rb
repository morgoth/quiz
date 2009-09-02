module QuestionHelper
  def generate_hint(value)
    marks = value.gsub(/\d/, '#').gsub(/\w/) { |x| x != '_' ? 'x' : '_' }
    counts = marks.gsub(/(x+)/) { |x| x.size }.gsub(/(#+)/) { |x| x.size }
    "#{marks} (#{counts})"
  end

  def time_to_end_exam(exam)
    sec = ((exam.started_at + exam.teacher_exam.duration.min.minutes) - Time.now).round
    min, sec = sec.divmod(60)
    "%d:%02d" % [min,sec]
  end

  def question_counter(exam, question)
    "#{question.position}/#{exam.questions.count}"
  end
end