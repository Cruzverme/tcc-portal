json.array!(@registration_courses) do |registration_course|
  json.extract! registration_course, :id, :admission_date, :locked, :conclusion_date, :curso_id, :aluno_id
  json.url registration_course_url(registration_course, format: :json)
end
