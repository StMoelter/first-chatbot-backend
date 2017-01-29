class ChatController < ApplicationController
  http_basic_authenticate_with name: 'sneak', password: 'preview'
  skip_before_filter :verify_authenticity_token

  def apiai
    apiai_response = ApiaiResponse.new(params.to_unsafe_h)
    render json: {
      source: "apiai-wikitest-webhook-sample",
      displayText: apiai_response.to_json.to_s,
      speech: apiai_response.to_json.to_s
    }
  end
end
