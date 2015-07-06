class TopMenuItem

  attr_accessor :parent_key, :key, :children, :text_en, :text_pt, :url

  def initialize(opts = {})
    self.parent_key = opts[:parent_key].to_s if opts[:parent_key].present?
    self.key = opts[:key].to_s if opts[:key].present?
    @children = Hash.new.with_indifferent_access
    yield self if block_given?
  end

  # convenience method to add children to menu item
  def add(child_key)
    raise ArgumentError unless block_given?
    raise IndexError if @children.has_key?(child_key)
    item = TopMenuItem.new(parent_key: key, key: child_key.to_s)
    @children[child_key] = item
    yield item
  end

  # Set text using i18n backend, by translation key
  def text_from_yml!(translation_key)
    self.text_en = I18n.t(translation_key, locale: :en)
    self.text_pt = I18n.t(translation_key, locale: :pt)
  end

  # Set text for both locales the same, from variable
  def text=(value)
    text_en = value
    text_pt = value
  end

end