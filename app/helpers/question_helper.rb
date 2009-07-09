module QuestionHelper
  def generate_hint(value)
    hint = ''
    sizes = '('
    value.split(' ').each do |word|
      chars = word.gsub(/[A-Za-z]/, 'x').gsub(/\d/, '#')
      hint << chars + ' '
      sizes << chars.mb_chars.length.to_s + ' '
    end
    hint + sizes.chop + ')'
  end

  def time_to_end_exam(exam)
    ((exam.started_at + exam.teacher_exam.duration.min.minutes) - Time.now).round
  end
end