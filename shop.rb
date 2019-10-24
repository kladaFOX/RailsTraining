cart = Cart.create(student_id: Student.last.id)
c1 = Course.create(name: "Ruby", price: 100)
c2 = Course.create(name: "Python", price: 150)
Position.create(cart_id: cart.id, course_id: c1.id, quantity: 2)
Position.create(cart_id: cart.id, course_id: c2.id, quantity: 1)
puts("У студента: #{Student.last.first_name} в корзине лежат:")
Student.last.cart.courses.each { |x| puts("name: #{x.name}, price: #{x.price}")}
