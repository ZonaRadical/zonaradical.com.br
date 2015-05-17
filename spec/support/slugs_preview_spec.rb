require 'spec_helper'

shared_examples_for 'slugs_preview' do
  describe 'GET #slug' do
    let(:slug_params) { { title: 'test slug' } }
    let(:response_expected) { { slug: 'test-slug' } }

    it 'returns a json with slug preview' do
      get :slug, slug_params
      expect(response.body).to eq response_expected.to_json
    end
  end
end
