module QuestionHelper
  def generate_hint(value)
    hint = ''
    value.split(' ').each { |word| hint << generate_chars(word) }
    hint.chop
  end

  def generate_chars(word)
    sign = word =~ /\A[+-]?\d+\Z/ ? '#' : 'x'
    sign*word.size+' '
  end
end