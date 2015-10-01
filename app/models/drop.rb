class Drop < ActiveRecord::Base

	paginates_per 10
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
	   validates_presence_of :cover

	   validates_uniqueness_of :track

end
