class CreateOfferResortAssignment < ActiveRecord::Migration
  def change
    create_table :offer_resort_assignments do |t|
      t.references :offer, index: true
      t.references :resort, index: true
    end
  end
end
