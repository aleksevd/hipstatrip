require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :fakeweb
  config.default_cassette_options = {
    match_requests_on: [:uri],
    record: :once
  }
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end
