json.array!(@cursos) do |curso|
  json.extract! curso, :id, :nome, :professores, :alunos, :carga_horaria, :coordenador
  json.url curso_url(curso, format: :json)
end
