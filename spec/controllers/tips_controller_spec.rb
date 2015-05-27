require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe TipsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # TipCategory. As you add validations to TipCategory, be sure to
  # adjust the attributes here as well.
  let(:tip_category) { create(:tip_category) }

  let(:valid_attributes){
    { :title => 'Name',
      :image => File.open(Rails.root.join('spec/fixtures/files/upload.jpg')),
      :tip_category_id => tip_category.id,
      :level1_description => 'Description level 1',
      :level2_description => 'Description level 2',
      :level3_description => 'Description level 3',
      :short_description => 'Short description',
      :slug => 'name'
    }
  }

  let(:gallery_images){
    {
        :images => [
            File.open(Rails.root.join('spec/fixtures/files/upload.jpg')),
            File.open(Rails.root.join('spec/fixtures/files/upload.jpg')),
        ]
    }
  }

  let(:invalid_attributes) {
    { :title => '' }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TipCategoriesController. Be sure to keep this updated too.
  describe 'Admin' do

  login_admin

    describe "GET show" do
      let(:tip) { Tip.create! valid_attributes }

      after(:each) do
        expect(assigns(:tip)).to eq(tip)
      end

      context 'when param is the id' do
        it "assigns the requested tip as @tip" do
          get :show, { category_id: tip.tip_category_id, id: tip.to_param }
        end
      end

      context 'when param is the slug' do
        it 'assigns the requested tip as @tip' do
          get :show, { category_id: tip.tip_category_id, id: tip.slug }
        end
      end
    end

    describe "GET edit" do
      it "assigns the requested tip as @tip" do
        tip = Tip.create! valid_attributes
        get :edit, {:id => tip.to_param}
        expect(assigns(:tip)).to eq(tip)
      end
    end

    describe "GET #new" do
      it "assigns a new Tip as @tip" do
        get :new, {}
        expect(assigns(:tip)).to be_a_new(Tip)
      end
    end

  describe "POST #create" do
    context "with valid params" do
      describe "creates a new Tip" do
        it "without image gallery" do
          expect {
            post :create, {:tip => valid_attributes}
          }.to change(Tip, :count).by(1)
        end

        it "with image gallery" do

          expect {
            post :create, {:tip => valid_attributes, :gallery_images => gallery_images}
          }.to change(Tip, :count).by(1)
        end
      end

      it "assigns a newly created tip as @tip" do
        post :create, {:tip => valid_attributes}
        expect(assigns(:tip)).to be_a(Tip)
        expect(assigns(:tip)).to be_persisted
      end
      it "redirects to the created tip" do
        post :create, {:tip => valid_attributes}
        expect(response).to redirect_to(show_tip_path(Tip.last.tip_category, Tip.last))
      end
    end
    context "with invalid params" do
      it "assigns a newly created but unsaved tip as @tip" do
        post :create, {:tip => invalid_attributes}
        expect(assigns(:tip)).to be_a_new(Tip)
      end

      it "re-renders the 'new' template" do
        post :create, {:tip => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          { :name => 'New Name',
            :email => 'new_email@mail.ru',
            :web => 'http://new-webaddress.ru',
            :fb => 'http://new-fb.com/tip',
            :tip_category_id => tip_category.id,
            :level1_description => 'Description level 01',
            :level2_description => 'Description level 02',
            :level3_description => 'Description level 03',
            :airport  => 'Milan Airport',
            :altitude_top => 4000,
            :altitude_bottom => 2000,
            :drop => 250,
            :terrain  => 200,
            :lifts  => 5,
            :slopes => '11/31/61',
            :map_url => 'http://new-tipmap.url'
          }
        }

        it "updates the requested tip" do
          tip = Tip.create! valid_attributes
          put :update, {:id => tip.id, :tip => new_attributes}
          tip.reload
          expect(response).to redirect_to(show_tip_path(tip.tip_category, tip))
        end

        it "assigns the requested tip as @tip" do
          tip = Tip.create! valid_attributes
          put :update, {:id => tip.to_param, :tip => new_attributes}
          expect(assigns(:tip)).to eq(tip)
        end

        it "redirects to the tip" do
          tip = Tip.create! valid_attributes
          put :update, {:id => tip.to_param, :tip => new_attributes}
          expect(response).to redirect_to(show_tip_path(tip.tip_category, tip))
        end
      end

    end

    describe 'GET #tip_redirect' do
      let(:tip) { create(:tip) }

      it 'returns status 301' do
        get :tip_redirect, { id: tip.id }
        expect(response).to redirect_to show_tip_path(tip.tip_category, tip)
      end
    end

    it_behaves_like 'slugs_preview'
  end

  describe 'Not Admin' do

    login_user

    describe "GET show" do
      it "assigns the requested tip as @tip" do
        tip = Tip.create! valid_attributes
        get :show, { category_id: tip.tip_category_id, id: tip.to_param }
        expect(assigns(:tip)).to eq(tip)
      end
    end

    describe "GET edit" do
      it "assigns the requested tip as @tip" do
        tip = Tip.create! valid_attributes
        get :edit, {:id => tip.to_param}
        expect(response).to redirect_to( root_path )
        expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          { :name => 'New Name',
            :email => 'new_email@mail.ru',
          }
        }

        it "redirect with no access" do
          tip = Tip.create! valid_attributes
          put :update, {:id => tip.id, :tip => new_attributes}
          tip.reload
          expect(assigns(:tip)).to eq(tip)
          expect(response).to redirect_to( root_path )
          expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
        end
      end
    end
  end
end
