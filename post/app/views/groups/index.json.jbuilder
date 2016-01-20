json.array!(@groups) do |group|
  json.extract! group, :id, :title, :content
  json.url group_url(group, format: :json)
end
