class Drop < ActiveRecord::Base

	 mount_uploader :cover, ImageUploader

	  mount_uploader :audio, AudioUploader
	  mount_uploader :clip, AudioUploader

	   acts_as_taggable

end
