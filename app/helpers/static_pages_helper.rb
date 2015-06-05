module StaticPagesHelper
  def gallery_image_link(gallery_image)
    case gallery_image.gallerable_type
    when 'Resort' then show_resort_path(gallery_image.gallerable.resort_category, gallery_image.gallerable)
    when 'Tip' then show_tip_path(gallery_image.gallerable.tip_category, gallery_image.gallerable)
    else url_for(@gallery_image.gallerable)
    end
  end
end
