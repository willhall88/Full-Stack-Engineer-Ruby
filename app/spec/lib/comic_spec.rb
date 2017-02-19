require 'rails_helper'
require './lib/comic.rb'

RSpec.describe ComicFetch do
  describe '#perform' do
    let(:comics) { ComicFetch.new.perform }

    context 'when valid' do
      subject(:status) { comics.code }
      it 'returns a 200 response code' do
        expect(status).to eq 200
      end
    end
  end
end
