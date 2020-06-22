json.extract! movie, :id, :title, :producer, :description, :release_date, :status, :user_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
