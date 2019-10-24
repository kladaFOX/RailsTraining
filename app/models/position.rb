class Position < ApplicationRecord
  belongs_to :course
  belongs_to :cart
end
