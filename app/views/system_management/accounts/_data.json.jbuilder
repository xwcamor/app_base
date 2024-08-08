json.extract! array, :id, :name, :deleted, :created_at, :updated_at
json.url  @main_url + "/" + array[:id].to_s + ".json"