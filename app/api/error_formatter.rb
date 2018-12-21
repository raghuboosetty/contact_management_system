# Generic error formatter
module ErrorFormatter
  def self.call message, _backtrace, _options, _env
    { response_type: 'error', response: message }.to_json
  end
end