json.extract! message, :id, :alias, :content, :sala_id, :created_at, :updated_at
json.url message_url(message, format: :json)
