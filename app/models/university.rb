class University < ApplicationRecord
  has_one :adress, :as => :addressable, dependent: :destroy
  has_many :groups, dependent: :destroy
end
