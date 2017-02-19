require 'rails_helper'

RSpec.describe ComicFetch do
  describe '#perform', :vcr do
    let(:comics) { ComicFetch.new.comic_results }

    context 'when valid' do
      subject(:status) { comics.code }
      it 'returns a 200 response code' do
        expect(status).to eq 200
      end
    end
  end
end
