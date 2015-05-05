class CreateOfferCountryAssignment < ActiveRecord::Migration
  def change
    create_table :offer_country_assignments do |t|
      t.references :offer, index: true
      t.references :resort_category, index: true
    end
  end
end
