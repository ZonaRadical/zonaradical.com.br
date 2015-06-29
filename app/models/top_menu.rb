class TopMenu
  include ActionView::Helpers
  include ActionView::Context

  attr_accessor :items

  def self.urls
    Rails.application.routes.url_helpers
  end

  def initialize
    @items = Hash.new.with_indifferent_access
    yield self if block_given?
  end

  def add(key)
    raise ArgumentError unless block_given?
    raise IndexError if @items.has_key?(key)
    item = TopMenuItem.new(parent_key: 'root', key: key.to_s)
    @items[key] = item
    yield item
  end

  def self.fetch
    @top_menu ||= self.build
  end

  def self.build
    TopMenu.new do |menu|
      menu.add :home do |home|
        home.text_from_yml!(:home)
        home.url = urls.root_path

        video_categories = VideoCategory.all.arrange
        video_categories.each do |video_category, sub_video_categories|
          home.add video_category.name do |category_item|
            category_item.text = video_category.name
            category_item.url = sub_video_categories.empty? ? '#' : urls.show_video_category_path(video_category)

            if sub_video_categories.present?
              sub_video_categories.each do |sub_video_category, sub_sub_video_categories|
                category_item.add sub_video_category.name do |sub_video_category_item|
                  sub_video_category_item.text = sub_video_category.name
                  sub_video_category_item.url = urls.show_video_category_path(sub_video_category)
                end
              end
            end
          end
        end

        home.add :galleries do |galleries|
          galleries.text_from_yml!('imageGalleries')
          galleries.url = urls.image_galleries_path
        end
      end

      menu.add :resorts do |resorts|
        resorts.text_from_yml!('resortsShort')
        resorts.url = urls.resorts_url

        resort_categories = ResortCategory.all.arrange
        resort_categories.each do |resort_category, resort_sub_categories|
          resorts.add resort_category.name do |category_item|
            category_item.text = resort_category.name
            category_item.url = urls.show_resort_category_path(resort_category)

            if resort_sub_categories.present?
              resort_sub_categories.each do |sub_resort_category, sub_sub_resort_categories|
                category_item.add sub_resort_category.name do |sub_resort_category_item|
                  sub_resort_category_item.text = sub_resort_category.name
                  sub_resort_category_item.url = urls.show_resort_category_path(sub_resort_category)
                end
              end
            end
          end
        end
      end

      menu.add :tips do |tips|
        tips.text_from_yml!('tipsShort')
        tips.url = urls.tips_path

        tips_categories = TipCategory.all
        tips_categories.each do |tips_category|
          tips.add tips_category.name do |tips_category_item, sub_tips_categories|
            tips_category_item.text = tips_category.name
            tips_category_item.url = urls.show_tip_category_path(tips_category)
          end
        end
      end

      menu.add :tours do |tours|
        tours.text_from_yml!('vamoJunto')
        tours.url = urls.tours_path
      end

      menu.add :offers do |offers|
        offers.text_from_yml!('offers')
        offers.url = urls.offers_path

        offers.add :agencies do |agencies|
          agencies.text_from_yml!('agencies')
          agencies.url = urls.agencies_path
        end
      end

      menu.add :forum do |forum|
        forum.text_from_yml!(:forum)
        forum.url = Rails.application.secrets.discourse_url
      end

      menu.add :galera do |galera|
        galera.text = 'Galera'
        galera.url = '#'

        galera.add :athletes do |athletes|
          athletes.text_from_yml!('athletes')
          athletes.url = urls.athletes_path
        end
        galera.add :organizations do |organizations|
          organizations.text_from_yml!('organizations')
          organizations.url = urls.organizations_path
        end
        galera.add :partners do |friends|
          friends.text = "Amigos e links úteis"
          friends.url = urls.friends_path
        end
        galera.add :contacts do |contacts|
          contacts.text = "Sobre o ZR"
          contacts.url = urls.galera_path
        end
      end
    end
  end

end