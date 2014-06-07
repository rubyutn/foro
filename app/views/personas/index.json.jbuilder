json.array!(@personas) do |persona|
  json.extract! persona, :id, :nombre, :apellido, :correo
  json.label persona.to_s
  json.url persona_url(persona, format: :json)
end
