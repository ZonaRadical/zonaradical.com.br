require 'rails_helper'

describe 'StaticPages', :type => :request do

  subject { page }

  describe 'Home' do
    before { visit root_path }

    it { should have_content( I18n.t('logoWinter') ) }
    it { should have_link( I18n.t('forum') ) }

  end
end
