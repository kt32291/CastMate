json.array!(@auditions) do |audition|
  json.extract! audition, :id, :name, :description, :theatre_id, :equity, :audition_start, :audition_end, :play_id
  json.url audition_url(audition, format: :json)
end
