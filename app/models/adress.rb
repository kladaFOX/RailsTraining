class Adress < ApplicationRecord
  belongs_to :addressable, polymorphic: true
end
