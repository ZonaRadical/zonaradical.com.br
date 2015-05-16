require 'spec_helper'

shared_examples_for 'slug' do |field|
  let(:model) { create(described_class, field => 'A simple title') }

  it { expect(subject).to validate_presence_of(:slug) }

  context "when create a new #{described_class}" do
    it "generates a slug based on the #{field}" do
      expect(model.slug).to eq 'a-simple-title'
    end
  end

  describe '#slug_preview' do
    let(:model_slug) { build(described_class, field => 'test slug preview')}

    it 'gets slug preview' do
      expect(model_slug.slug_preview).to eq 'test-slug-preview'
    end
  end
end
