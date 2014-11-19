module GlyphHelper
  # ==== Examples
  # glyph(:share_alt)
  # # => <i class="icon-share-alt"></i>
  # glyph(:lock, :white)
  # # => <i class="icon-lock icon-white"></i>
  # glyph(:thumbs_up, :pull_left)
  # # => <i class="icon-thumbs-up pull-left"></i>

  def glyph(*names)
    names.map! { |name| name.to_s.gsub('_','-') }
    names.map! do |name|
      name =~ /pull-(?:left|right)/ ? name : "glyphicon-#{name}"
    end
    names.unshift "glyphicon"
    content_tag :span, nil, :class => names
  end


  def glyph_to(name, url, html_options = {})
    link_to glyph(name), url, html_options
  end

end
