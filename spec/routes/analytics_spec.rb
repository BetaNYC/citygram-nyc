require 'spec_helper'

describe Citygram::Routes::Analytics do
  include Citygram::Routes::TestHelpers

  describe 'GET /analytics' do
    it 'responds with 200' do
      get '/analytics'
      expect(last_response.status).to eq 200
    end
  end
end
