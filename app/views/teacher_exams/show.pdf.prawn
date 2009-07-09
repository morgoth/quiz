pdf.text "Results of exam: #{@teacher_exam.name}", :size => 20, :style => :bold
pdf.text "Max points of this exam: #{@teacher_exam.max_points}"
  students = @teacher_exam.exams.map do |exam|
    [ exam.student.login,
      exam.sum_points,
      exam.state
    ]
  end
pdf.move_down(20)
pdf.table students, :border_style => :grid,
                    :headers => ["Login", "Result", "State"]