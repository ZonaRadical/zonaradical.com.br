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

RSpec.describe MediaImageCategoriesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # MediaImageCategory. As you add validations to MediaImageCategory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:name => 'Some Category', :description => 'A lot of text',
     :image => File.open(Rails.root.join('spec/fixtures/files/upload.jpg')),
     }
  }

  let(:invalid_attributes) {
    {:name =>  '', :description => 'description'}
  }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MediaImageCategoriesController. Be sure to keep this updated too.
  describe 'Admin' do

    login_admin


    describe "GET index" do
      it "assigns media_image_categories as @media_image_categories with pagination" do

        media_image_categories = MediaImageCategory.all
        get :index, {}
        expect(assigns(:media_image_categories)).to eq(media_image_categories)
      end
    end

    describe "GET show" do
      it "assigns the requested media_image_category as @media_image_category" do
        media_image_category = MediaImageCategory.create! valid_attributes
        get :show, {:id => media_image_category.to_param}
        expect(assigns(:media_image_category)).to eq(media_image_category)
      end
    end

    describe "GET new" do
      it "assigns a new media_image_category as @media_image_category" do
        get :new, {}
        expect(assigns(:media_image_category)).to be_a_new(MediaImageCategory)
      end
    end

    describe "GET edit" do
      it "assigns the requested media_image_category as @media_image_category" do
        media_image_category = MediaImageCategory.create! valid_attributes
        get :edit, {:id => media_image_category.to_param}
        expect(assigns(:media_image_category)).to eq(media_image_category)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new MediaImageCategory" do
          expect {
            post :create, {:media_image_category => valid_attributes}
          }.to change(MediaImageCategory, :count).by(1)
        end

        it "assigns a newly created media_image_category as @media_image_category" do
          post :create, {:media_image_category => valid_attributes}
          expect(assigns(:media_image_category)).to be_a(MediaImageCategory)
          expect(assigns(:media_image_category)).to be_persisted
        end

        it "redirects to the created media_image_category" do
          post :create, {:media_image_category => valid_attributes}
          expect(response).to redirect_to(MediaImageCategory.last)
        end
      end

      describe "with invalid params" do
        render_views
        it "assigns a newly created but unsaved media_image_category as @media_image_category" do
          post :create, {:media_image_category => invalid_attributes}
          expect(assigns(:media_image_category)).to be_a(MediaImageCategory)
        end

        it "re-renders the 'new' template" do
          post :create, {:media_image_category => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          { :name => 'Changed Category II', :description => 'Changed description' }
        }

        it "updates the requested media_image_category" do
          media_image_category = MediaImageCategory.create! valid_attributes
          put :update, {:id => media_image_category.id, :media_image_category => new_attributes}
          media_image_category.reload
          expect(response).to redirect_to(MediaImageCategory.last)
        end

        it "assigns the requested media_image_category as @media_image_category" do
          media_image_category = MediaImageCategory.create! valid_attributes
          put :update, {:id => media_image_category.to_param, :media_image_category => new_attributes}
          expect(assigns(:media_image_category)).to eq(media_image_category)
        end

        it "redirects to the media_image_category" do
          media_image_category = MediaImageCategory.create! valid_attributes
          put :update, {:id => media_image_category.to_param, :media_image_category => new_attributes}
          expect(response).to redirect_to(media_image_category)
        end
      end

      describe "with invalid params" do
        it "assigns the media_image_category as @media_image_category" do
          media_image_category = MediaImageCategory.create! valid_attributes
          put :update, {:id => media_image_category.to_param, :media_image_category => invalid_attributes}
          expect(assigns(:media_image_category)).to eq(media_image_category)
        end

        it "re-renders the 'edit' template" do
          media_image_category = MediaImageCategory.create! valid_attributes
          put :update, {:id => media_image_category.to_param, :media_image_category => invalid_attributes}
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested media_image_category" do
        media_image_category = MediaImageCategory.create! valid_attributes
        expect {
          delete :destroy, {:id => media_image_category.to_param}
        }.to change(MediaImageCategory, :count).by(-1)
      end

      it "redirects to the media_image_categories list" do
        media_image_category = MediaImageCategory.create! valid_attributes
        delete :destroy, {:id => media_image_category.to_param}
        expect(response).to redirect_to(media_image_categories_url)
      end
    end
  end




  describe 'User' do

    login_user


    describe "GET index" do
      it "assigns all media_image_categories as @media_image_categories" do
        media_image_categories = MediaImageCategory.all
        get :index, {}
        expect(assigns(:media_image_categories)).to eq( media_image_categories)
      end
    end

    describe "GET show" do
      it "assigns the requested media_image_category as @media_image_category" do
        media_image_category = MediaImageCategory.create! valid_attributes
        get :show, {:id => media_image_category.to_param}
        expect(assigns(:media_image_category)).to eq(media_image_category)
      end
    end

    describe "GET new" do
      it "assigns a new media_image_category as @media_image_category" do
        get :new, {}
        expect(response).to redirect_to( root_path )
        expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
      end
    end

    describe "GET edit" do
      it "assigns the requested media_image_category as @media_image_category" do
        media_image_category = MediaImageCategory.create! valid_attributes
        get :edit, {:id => media_image_category.to_param}
        expect(response).to redirect_to( root_path )
        expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "doesn't create a new MediaImageCategory" do
          expect {
            post :create, {:media_image_category => valid_attributes}
          }.to change(MediaImageCategory, :count).by(0)
        end

        it "redirects to the site root with flash-alert" do
          post :create, {:media_image_category => valid_attributes}
          expect(response).to redirect_to( root_path )
          expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          {:name => 'Changed Category II', :description => 'Changed description', :parent_id => 2}
        }

        it "does not update the requested media_image_category" do
          media_image_category = MediaImageCategory.create! valid_attributes
          put :update, {:id => media_image_category.id, :media_image_category => new_attributes}
          media_image_category.reload
          expect(response).to redirect_to( root_path )
          expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
        end

        it "redirects to the site_root with flash-alert" do
          media_image_category = MediaImageCategory.create! valid_attributes
          put :update, {:id => media_image_category.to_param, :media_image_category => new_attributes}
          expect(response).to redirect_to( root_path )
          expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested media_image_category" do
        media_image_category = MediaImageCategory.create! valid_attributes
        expect {
          delete :destroy, {:id => media_image_category.to_param}
        }.to change(MediaImageCategory, :count).by(0)
      end

      it "redirects to the site root with flash-alert" do
        media_image_category = MediaImageCategory.create! valid_attributes
        delete :destroy, {:id => media_image_category.to_param}
        expect(response).to redirect_to( root_path )
        expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
      end
    end
  end

end
