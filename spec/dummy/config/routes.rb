Rails.application.routes.draw do
  mount OpenStax::OpenApi::Engine => "/openstax_openapi"
end
