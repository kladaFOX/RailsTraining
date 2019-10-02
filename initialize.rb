last_names = ['Klapatok', 'Stashkevich', 'Osipik', 'Kamenko', 'Chibisov', 'Lagun']
first_names = ['Ilya', 'Andrey', 'Ivan', 'Pavel', 'Ivan', 'Aleksey']
g = Group.create(number: 753505)
headman = Student.create(last_name: 'Alhovskiy', first_name: 'Evgeniy', patronymic: 'Nikolaevich', group_id: g.id)
headman.headman_id = headman.id
headman.save
StudentCard.create(card_number: 75350000 + headman.id, faculty: 'FKSIS', form_of_training: 'daytime')
last_names.each.with_index do |x, i|
  s = Student.create(last_name: x, first_name: first_names[i], group_id: g.id, headman_id: headman.id)
  StudentCard.create(card_number: 75350000 + s.id, faculty: 'FKSIS', form_of_training: 'daytime', student_id: s.id)
end
