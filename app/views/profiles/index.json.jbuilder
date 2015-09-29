json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :image, :bio, :slug, :website, :display_name
  json.url profile_url(profile, format: :json)
end
