json.extract! painting, :id, :title, :description, :year, :dimensions, :medium, :support, :framed, :price, :created_at, :updated_at
json.url painting_url(painting, format: :json)
