GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end

GrapeSwaggerRails.options.url      = '/api/v1/swagger.json'
GrapeSwaggerRails.options.app_name = 'Contact Management API'
GrapeSwaggerRails.options.api_key_name = 'Authorization'