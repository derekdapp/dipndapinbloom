class Bill < ActiveRecord::Base
	belongs_to :custom
	validates_numericality_of :tip, greater_than_or_equal_to: 0

end
