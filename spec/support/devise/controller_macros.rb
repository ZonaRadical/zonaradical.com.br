module ControllerMacros
  def login_admin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      admin = FactoryGirl.create(:admin)
      sign_in :user, admin
    end
  end

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end

  def login_editor
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:editor]
      editor = FactoryGirl.create(:editor)
      sign_in :user, editor
    end
  end
end