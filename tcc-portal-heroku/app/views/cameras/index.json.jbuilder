json.array!(@cameras) do |camera|
  json.extract! camera, :id, :ip_video, :ip_audio, :disponivel, :sala, :horario_disponivel_inicial, :horario_disponivel_final, :curso_id, :user_id
  json.url camera_url(camera, format: :json)
end
