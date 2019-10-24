class Cart < ApplicationRecord
  belongs_to :student
  has_many :positions, dependent: :destroy
  has_many :courses, through: :positions

  def checkout
    o = Order.create(student_id: self.student_id)
    amount = 0
    self.positions.each do |x|
      OrderPosition.create(order_id: o.id, course_id: x.course_id, quantity: x.quantity)
      amount += x.course.price * x.quantity
    end
    o.update_column(:amount, amount)
    o.save
  end
end
