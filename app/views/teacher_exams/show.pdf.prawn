pdf.text t("views.teacher_exams.show.results") + " #{@teacher_exam.name}", :size => 20, :style => :bold
pdf.text t("views.teacher_exams.show.max_points") + " #{@teacher_exam.max_points}"
  students = @teacher_exam.exams.map do |exam|
    [ exam.student_login,
      exam.sum_points,
      exam.state
    ]
  end
pdf.move_down(20)
pdf.table students, :border_style => :grid,
                    :headers => ["Login", "Result", "State"]