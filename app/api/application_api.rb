class ApplicationApi < Grape::API
  prefix 'api'
  version 'v1', using: :path
  use ApiErrorHandler
  content_type :json, 'application/json'
  default_format :json
  mount ApplicationApi::V1::Base
  error_formatter :json, ApplicationApi::ErrorFormatter

  rescue_from :all

  add_swagger_documentation base_path: "/",
    api_version: 'v1',
    hide_documentation_path: true,
    hide_format: true,
    mount_path: 'swagger.json',
    info: {
      title: "API",
      description: "Contact Management API"
    }  
end