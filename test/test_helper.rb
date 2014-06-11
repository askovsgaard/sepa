require 'codeclimate-test-reporter'
require 'minitest/autorun'
require 'dotenv'
Dotenv.load

if ENV['CODECLIMATE_REPO_TOKEN']
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
else
  SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
end

SimpleCov.start do
  add_filter "/test/"
  add_filter "/vendor/"
end

require 'sepafm'
require 'sepa/fixtures'

# Test responses
NORDEA_TEST_RESPONSE_PATH = "#{ROOT_PATH}/test/sepa/banks/nordea/responses"

# Test keys
DANSKE_TEST_KEYS_PATH = "#{ROOT_PATH}/test/sepa/banks/danske/keys"

I18n.enforce_available_locales = true
