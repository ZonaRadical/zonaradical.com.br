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

RSpec.describe ResortCategoriesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # ResortCategory. As you add validations to ResortCategory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:name => 'Some Category', :description => 'A lot of text', :parent_id => 1}
  }

  let(:invalid_attributes) {
    {:name => '', :description => 'A lot of text', :parent_id => 1}
  }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ResortCategoriesController. Be sure to keep this updated too.
  describe 'Admin' do

  login_admin


    describe "GET index" do
      it "assigns all resort_categories as @resort_categories" do
        resort_categories = ResortCategory.all
        get :index, {}
        expect(assigns(:resort_categories)).to eq(resort_categories)
      end
    end

    describe "GET show" do
      it "assigns the requested resort_category as @resort_category" do
        resort_category = ResortCategory.create! valid_attributes
        get :show, {:id => resort_category.to_param}
        expect(assigns(:resort_category)).to eq(resort_category)
      end
    end

    describe "GET new" do
      it "assigns a new resort_category as @resort_category" do
        get :new, {}
        expect(assigns(:resort_category)).to be_a_new(ResortCategory)
      end
    end

    describe "GET edit" do
      it "assigns the requested resort_category as @resort_category" do
        resort_category = ResortCategory.create! valid_attributes
        get :edit, {:id => resort_category.to_param}
        expect(assigns(:resort_category)).to eq(resort_category)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new ResortCategory" do
          expect {
            post :create, {:resort_category => valid_attributes}
          }.to change(ResortCategory, :count).by(1)
        end

        it "assigns a newly created resort_category as @resort_category" do
          post :create, {:resort_category => valid_attributes}
          expect(assigns(:resort_category)).to be_a(ResortCategory)
          expect(assigns(:resort_category)).to be_persisted
        end

        it "redirects to the created resort_category" do
          post :create, {:resort_category => valid_attributes}
          expect(response).to redirect_to(ResortCategory.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved resort_category as @resort_category" do
          post :create, {:resort_category => invalid_attributes}
          expect(assigns(:resort_category)).to be_a_new(ResortCategory)
        end

        it "re-renders the 'new' template" do
          post :create, {:resort_category => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          {:name => 'Changed Category II', :description => 'Changed description', :parent_id => 1}
        }

        it "updates the requested resort_category" do
          resort_category = ResortCategory.create! valid_attributes
          put :update, {:id => resort_category.id, :resort_category => new_attributes}
          resort_category.reload
          expect(response).to redirect_to(ResortCategory.last)
        end

        it "assigns the requested resort_category as @resort_category" do
          resort_category = ResortCategory.create! valid_attributes
          put :update, {:id => resort_category.to_param, :resort_category => valid_attributes}
          expect(assigns(:resort_category)).to eq(resort_category)
        end

        it "redirects to the resort_category" do
          resort_category = ResortCategory.create! valid_attributes
          put :update, {:id => resort_category.to_param, :resort_category => valid_attributes}
          expect(response).to redirect_to(resort_category)
        end
      end

      describe "with invalid params" do
        it "assigns the resort_category as @resort_category" do
          resort_category = ResortCategory.create! valid_attributes
          put :update, {:id => resort_category.to_param, :resort_category => invalid_attributes}
          expect(assigns(:resort_category)).to eq(resort_category)
        end

        it "re-renders the 'edit' template" do
          resort_category = ResortCategory.create! valid_attributes
          put :update, {:id => resort_category.to_param, :resort_category => invalid_attributes}
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested resort_category" do
        resort_category = ResortCategory.create! valid_attributes
        expect {
          delete :destroy, {:id => resort_category.to_param}
        }.to change(ResortCategory, :count).by(-1)
      end

      it "redirects to the resort_categories list" do
        resort_category = ResortCategory.create! valid_attributes
        delete :destroy, {:id => resort_category.to_param}
        expect(response).to redirect_to(resort_categories_url)
      end
    end
  end




  describe 'User' do

    login_user


    describe "GET index" do
      it "assigns all resort_categories as @resort_categories" do
        resort_category = ResortCategory.create! valid_attributes
        get :index, {}
        expect(response).to redirect_to( root_path )
        expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
      end
    end

    describe "GET show" do
      it "assigns the requested resort_category as @resort_category" do
        resort_category = ResortCategory.create! valid_attributes
        get :show, {:id => resort_category.to_param}
        expect(assigns(:resort_category)).to eq(resort_category)
      end
    end

    describe "GET new" do
      it "assigns a new resort_category as @resort_category" do
        get :new, {}
        expect(response).to redirect_to( root_path )
        expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
      end
    end

    describe "GET edit" do
      it "assigns the requested resort_category as @resort_category" do
        resort_category = ResortCategory.create! valid_attributes
        get :edit, {:id => resort_category.to_param}
        expect(response).to redirect_to( root_path )
        expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "doesn't create a new ResortCategory" do
          expect {
            post :create, {:resort_category => valid_attributes}
          }.to change(ResortCategory, :count).by(0)
          end

        it "redirects to the site root with flash-alert" do
          post :create, {:resort_category => valid_attributes}
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

        it "does not update the requested resort_category" do
          resort_category = ResortCategory.create! valid_attributes
          put :update, {:id => resort_category.id, :resort_category => new_attributes}
          resort_category.reload
          expect(response).to redirect_to( root_path )
          expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
        end

        it "redirects to the site_root with flash-alert" do
          resort_category = ResortCategory.create! valid_attributes
          put :update, {:id => resort_category.to_param, :resort_category => valid_attributes}
          expect(response).to redirect_to( root_path )
          expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested resort_category" do
        resort_category = ResortCategory.create! valid_attributes
        expect {
          delete :destroy, {:id => resort_category.to_param}
        }.to change(ResortCategory, :count).by(0)
      end

      it "redirects to the site root with flash-alert" do
        resort_category = ResortCategory.create! valid_attributes
        delete :destroy, {:id => resort_category.to_param}
        expect(response).to redirect_to( root_path )
        expect( response.request.flash[:alert] ).to eq('You are not authorized to access this page.')
      end
    end
  end

end