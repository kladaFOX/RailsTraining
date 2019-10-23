puts 'find_by:'
Student.find_by(first_name: 'Ilya')
puts 'sort:'
Student.order(:last_name)
Student.find_each { |x| puts x.last_name }
puts 'all kind of marks:'
puts SubjectMark.select(:mark).group(:mark).count
puts 'students with 3 or lower points:'
dvoe = SubjectMark.unsatisfactory
dvoe.each {|x| puts x.student.last_name}
puts 'students with 4 or higher points:'
dvoe = SubjectMark.satisfactory
dvoe.each {|x| puts x.student.last_name}
puts 'average marks:'
puts SubjectMark.last_names_average
