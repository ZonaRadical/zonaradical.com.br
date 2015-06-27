module ApplicationHelper
  def nested_dropdown(items)
    result = []
    items.map do |item, sub_items|
      result << [('- ' * item.depth) + item.name, item.id]
      result += nested_dropdown(sub_items) unless sub_items.blank?
    end
    result
  end

  def sex sex
    if sex.blank?
      '?'
    elsif
      sex == 'm' ? t('man') : t('women')
    end
  end

  def cut_phrase(origin,dim)
    if origin.length < dim
      out=origin
    else
      out=origin[0..dim]
      out+='...'
    end
  end

  def discourse_client
    @discourse_client ||= DiscourseZr.client
  end

  def menu_discourse_url
    url = Rails.application.secrets.discourse_url
    url << '/session/sso?return_path=%2F' if user_signed_in?
    url
  end

end
