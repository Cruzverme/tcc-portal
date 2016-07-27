json.array!(@disciplines) do |discipline|
  json.extract! discipline, :id, :name, :workload, :ementa, :description, :bibliography, :curso_id
  json.url discipline_url(discipline, format: :json)
end
