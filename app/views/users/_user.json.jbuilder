json.extract! user, :id, :name, :referral_code, :created_at, :updated_at
json.url user_url(user, format: :json)
