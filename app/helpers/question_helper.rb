module QuestionHelper
  def generate_hint(value)
    hint = ''
    value.split(' ').each { |word| hint << generate_chars(word) }
    hint.chop
  end

  def time_to_end_exam(exam)
    ((exam.started_at + exam.teacher_exam.duration.min.minutes) - Time.now).round
  end

  def generate_chars(word)
    sign = word =~ /\A[+-]?\d+\Z/ ? '#' : 'x'
    sign*word.mb_chars.length+' '
  end
end