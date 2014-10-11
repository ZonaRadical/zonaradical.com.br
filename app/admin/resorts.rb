ActiveAdmin.register Resort do
  index do
    column :name
    column :image do |resort|
      image_tag resort.image_url(:thumb).to_s
    end
    actions
  end
end