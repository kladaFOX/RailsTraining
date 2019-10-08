last_names = ['Klapatok', 'Stashkevich', 'Osipik', 'Kamenko', 'Chibisov', 'Lagun']
first_names = ['Ilya', 'Andrey', 'Ivan', 'Pavel', 'Ivan', 'Aleksey']
regions = ['Homel', 'Minsk', 'Mogilev', 'Brest', 'Hrodno', 'Vitebsk']
subjects = ['MCHA', 'PPO', 'AVS']
lecturers = ['Anisimov', 'Halkovskiy', 'Volorova']
u = University.create(name: 'BSUIR')
Adress.create country: 'Belarus', region: 'Minsk', locality: 'Minsk', street: 'Hikalo',
  house: '9', addressable_id: u.id, addressable_type: u.class
subjects.each.with_index do |x, i|
  sub = Subject.create(name: x)
  Lecturer.create(last_name: lecturers[i], subject_id: sub.id)
end

g = Group.create(number: 753505, university_id: u.id)

headman = Student.create(last_name: 'Alhovskiy', first_name: 'Evgeniy', patronymic: 'Nikolaevich', group_id: g.id)
headman.headman_id = headman.id
headman.save
StudentCard.create(card_number: 75350000 + headman.id, faculty: 'FKSIS', form_of_training: 'daytime', student_id: headman.id)
Adress.create country: 'Belarus', region: 'Homel', addressable_id: headman.id, addressable_type: headman.class

last_names.each.with_index do |x, i|
  s = Student.create(last_name: x, first_name: first_names[i], group_id: g.id, headman_id: headman.id)
  StudentCard.create(card_number: 75350000 + s.id, faculty: 'FKSIS', form_of_training: 'daytime', student_id: s.id)
  Adress.create country: 'Belarus', region: regions[i], addressable_id: s.id, addressable_type: s.class
end

SubjectMark.create(student_id: Student.last.id, subject_id: Subject.last.id, mark: 10)

# subjects.each do |x|
# end
