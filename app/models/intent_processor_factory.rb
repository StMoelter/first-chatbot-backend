class IntentProcessorFactory
  def initialize(type)
    @type = type
  end

  def klass
    case @type.to_sym
    when :global_search then IntentProcessor::GlobalSearch
    when :time then IntentProcessor::Time
    else
      IntentProcessor::Unknown
    end
  end
end
