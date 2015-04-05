require "rails_helper"

describe UsersHelper do
  describe "#can_add_gallery" do
    before :each do
      @admin = create(:admin)
      @editor = create(:editor)
      @athlete = create(:athlete)
    end

    context "return TRUE" do
      context "user is the current_user" do
        it "user has admin role" do
          allow(helper).to receive(:current_user).and_return(@admin)
          expect(helper.can_add_gallery?(@admin)).to eq(true)
        end
        it "user has athlete role" do
          allow(helper).to receive(:current_user).and_return(@athlete)
          expect(helper.can_add_gallery?(@athlete)).to eq(true)
        end
      end
    end

    context "return FALSE" do
      context "user is the current_user" do
        before :each do
          allow(helper).to receive(:current_user).and_return(@editor)
        end
        
        it "user don't has admin nor athlete role" do
          expect(helper.can_add_gallery?(@editor)).to eq(false)
        end
      end
      
      it "user isn't the current user" do
        allow(helper).to receive(:current_user).and_return(@athlete)
        expect(helper.can_add_gallery?(@admin)).to eq(false)
      end
    end
  end
end