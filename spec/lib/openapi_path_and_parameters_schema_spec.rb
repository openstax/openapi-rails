require 'rails_helper'

RSpec.describe 'openapi_path_and_parameters_schema' do

  it 'generates open api version 3 path and components definitions' do
    json = Swagger::Blocks.build_root_json([OpenApiPathAndParametersSchema1])

    expect(json[:paths]).to include({
      :"/stembolts" => hash_including({
        get: hash_including({
          summary: "A summary",
          operationId: "getStembolts",
          parameters: array_including([
            hash_including({
              name: :param1,
              schema: {type: 'string'},
            })
          ])
        }),
      })
    })

    expect(json[:components][:schemas]).to include({
      StemBolt: hash_including({
        required: ['id'],
        properties: hash_including({
          name: hash_including({
            type: :string,
            nullify: true,
            description: 'The stembolt name.',
          })
        })
      })
    })
  end

  it 'works when there are two path calls' do
    json = Swagger::Blocks.build_root_json([OpenApiPathAndParametersSchema2])

    expect(json[:paths]).to include({
      :"/stembolts" => hash_including({
        get: hash_including({
          summary: "A summary",
          operationId: "getStembolts"
        })
      })
    })

    expect(json[:paths][:'/stembolts']).to include({
      :get => hash_including({
        parameters: array_including(
          {:name=>:param1, :in=>:query, :type=>:string},
          {:name=>:param2, :in=>:query, :type=>:string, description: "Not param1"}
        )
      })
    })
  end

end
