last_names = ['Klapatok', 'Stashkevich', 'Osipik', 'Kamenko', 'Chibisov', 'Lagun']
first_names = ['Ilya', 'Andrey', 'Ivan', 'Pavel', 'Ivan', 'Aleksey']
subjects = ['MCHA', 'PPO', 'AVS']
lecturers = ['Anisimov', 'Halkovskiy', 'Volorova']

subjects.each.with_index do |x, i|
  sub = Subject.create(name: x)
  Lecturer.create(last_name: lecturers[i], subject_id: sub.id)
end

g = Group.create(number: 753505)

headman = Student.create(last_name: 'Alhovskiy', first_name: 'Evgeniy', patronymic: 'Nikolaevich', group_id: g.id)
headman.headman_id = headman.id
headman.save
StudentCard.create(card_number: 75350000 + headman.id, faculty: 'FKSIS', form_of_training: 'daytime', student_id: headman.id)

last_names.each.with_index do |x, i|
  s = Student.create(last_name: x, first_name: first_names[i], group_id: g.id, headman_id: headman.id)
  StudentCard.create(card_number: 75350000 + s.id, faculty: 'FKSIS', form_of_training: 'daytime', student_id: s.id)
end

SubjectMark.create(student_id: Student.last.id, subject_id: Subject.last.id, mark: 10)

# subjects.each do |x|
# end
