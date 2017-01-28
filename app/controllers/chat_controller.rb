class ChatController < ApplicationController
  http_basic_authenticate_with name: 'sneak', password: 'preview'
  skip_before_filter :verify_authenticity_token

  def apiai
    render json: {
        source: "apiai-wikitest-webhook-sample",
        displayText: params.to_unsafe_h.to_json.to_s
    }
  end
end
