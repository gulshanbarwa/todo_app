class Datum < ApplicationRecord
	has_many :current
	validates :plan, presence: true
end
