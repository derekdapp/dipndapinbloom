class Custom < ActiveRecord::Base
	has_many :messages
	has_one :bill
	validates :canvas_size, presence: true
	validates :name, presence: true
	validates :info, presence: true
	validates :email, presence: true

  private


end
