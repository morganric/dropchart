class Drop < ActiveRecord::Base

		  extend FriendlyId
	  friendly_id :track, use: :slugged

	 mount_uploader :cover, ImageUploader

	  mount_uploader :audio, AudioUploader
	  mount_uploader :clip, AudioUploader

	   acts_as_taggable

	   belongs_to :user


end
