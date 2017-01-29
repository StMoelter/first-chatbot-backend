class ChatController < ApplicationController
  http_basic_authenticate_with name: 'sneak', password: 'preview'
  skip_before_action :verify_authenticity_token

  def apiai
    apiai_response = ApiaiResponse.new(params.to_unsafe_h)
    processor = IntentProcessorFactory.new(apiai_response.intent).klass
    output = processor.process(apiai_response.entities)
    render json: {
      source: 'apiai-wikitest-webhook-sample',
      displayText: output,
      speech: output
    }
  end
end
