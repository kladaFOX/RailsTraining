cart = Cart.create(student_id: Student.last.id)
c1 = Course.create(name: "Ruby", price: 100)
c2 = Course.create(name: "Python", price: 150)
Position.create(cart_id: cart.id, course_id: c1.id, quantity: 2)
Position.create(cart_id: cart.id, course_id: c2.id, quantity: 1)
puts("У студента: #{Student.last.first_name} в корзине лежат:")
Student.last.cart.courses.find_each { |x| puts("name: #{x.name}, price: #{x.price}")}

cart.checkout
positions = Order.last.order_positions
names = []
positions.each { |x| names << x.course.name }
id = Order.last.id
amount = Order.last.amount
puts("Ваш заказ номер: #{id} -- позиции:")
positions.each.with_index { |x, i| puts("#{i+1}: #{names[i]} -- #{x.quantity}") }
puts("Сумма: #{amount}")
