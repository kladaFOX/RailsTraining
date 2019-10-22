puts 'find_by:'
Student.find_by first_name: 'Ilya'
puts 'sort:'
Student.order :last_name
Student.find_each { |x| puts x.last_name }
puts 'all kind of marks:'
puts SubjectMark.select(:mark).group(:mark).count
puts 'students with 2 or lower points:'
dvoe = SubjectMark.where("mark <= 2").includes(:student)
dvoe.each {|x| puts x.student.last_name}
puts 'students with 3 or higher points:'
dvoe = SubjectMark.where("mark >= 3").includes(:student)
dvoe.each {|x| puts x.student.last_name}
