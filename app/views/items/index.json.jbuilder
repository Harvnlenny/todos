json.array!(@items) do |item|
  json.extract! item, :id, :task, :due_date, :is_complete, :list_id
  json.url item_url(item, format: :json)
end
