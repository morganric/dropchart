class Drop < ActiveRecord::Base

	
 extend FriendlyId
  friendly_id :track, use: :slugged

	 mount_uploader :cover, ImageUploader

	  mount_uploader :audio, AudioUploader
	  mount_uploader :clip, AudioUploader

	   acts_as_taggable

	   belongs_to :user

	   validates_presence_of :track
	   validates_presence_of :artist
	   validates_presence_of :audio

	   validates_uniqueness_of :track

end
