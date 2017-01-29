class ApiaiResponse

  def initialize(params = {})
    @response = params.deep_symbolize_keys
  end

  def intent
    @response.dig(:result, :metadata, :intentName)
  end

  def entities
    @response.dig(:result, :parameters).to_h
  end

  def to_json
    {
      intend: intend,
      entities: entities
    }.to_json
  end

end