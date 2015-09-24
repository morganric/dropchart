json.array!(@drops) do |drop|
  json.extract! drop, :id, :audio, :clip, :cover, :release_date, :url, :user_id, :slug, :tag_list, :artist, :track, :label, :album, :credits
  json.url drop_url(drop, format: :json)
end
