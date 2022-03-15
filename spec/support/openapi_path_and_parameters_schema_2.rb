module OpenApiPathAndParametersSchema2
  include OpenStax::OpenApi::Blocks

  openapi_root do
    key :openapi, '3.0.0'
  end

  openapi_path '/stembolts' do
    operation :post do
    end
  end

  openapi_path_and_parameters_schema '/stembolts' do
    operation :get do
      key :summary, 'A summary'
      key :operationId, 'getStembolts'
      key :produces, [
        'application/json'
      ]
      key :tags, [
        'Stembolts'
      ]
      parameter do
        key :name, :param1
        key :in, :query
        key :type, :string
        key :required, true
      end
      parameter do
        key :name, :param2
        key :in, :query
        key :type, :string
        key :required, false
        key :description, 'Not param1'
      end
      response 200 do
        key :description, 'Success.'
      end
    end
  end
end
