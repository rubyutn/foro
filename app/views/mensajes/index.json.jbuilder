json.array!(@mensajes) do |mensaje|
  json.extract! mensaje, :id, :cuerpo, :persona_id
  json.url mensaje_url(mensaje, format: :json)
end
