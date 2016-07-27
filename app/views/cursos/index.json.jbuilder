json.array!(@cursos) do |curso|
  json.extract! curso, :id, :aluno_id, :professor_id, :coordenador_id
  json.url curso_url(curso, format: :json)
end
