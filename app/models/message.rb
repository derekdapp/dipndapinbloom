class Message < ActiveRecord::Base
	belongs_to :custom
	mount_uploader :image, ImageUploader
	validates :author, presence: true
	validates :body, presence: true
end
