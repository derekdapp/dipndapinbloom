class Message < ActiveRecord::Base
	belongs_to :custom
	mount_uploader :image, ImageUploader
end
