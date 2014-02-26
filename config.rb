# Uncomment these to use regular Ruby gems.
require 'modular-scale'
require 'sassy-math'

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload, :host => "127.0.0.1"

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  # Calculate the years for a copyright
  def copyright_years(start_year)
    end_year = Date.today.year
    if start_year == end_year
      start_year.to_s
    else
      start_year.to_s + '-' + end_year.to_s
    end
  end

  # Holder.js image placeholder helper
  def img_holder(opts = {})
    return "Missing Image Dimension(s)" unless opts[:width] && opts[:height]
    return "Invalid Image Dimension(s)" unless opts[:width].to_s =~ /^\d+\%*$/ && opts[:height].to_s =~ /^\d+\%*$/

    img  = "<img data-src=\"holder.js/#{opts[:width]}x#{opts[:height]}/auto"
    img << "/#{opts[:bgcolor]}:#{opts[:fgcolor]}" if opts[:fgcolor] && opts[:bgcolor]
    img << "/text:#{opts[:text].gsub(/'/,"\'")}" if opts[:text]
    img << "\" width=\"#{opts[:width]}\" height=\"#{opts[:height]}\">"

    img
  end

  #menu helper
  def menu_tag_builder(array, &block)
    return "" if array.nil?
    result = "<ul>\n"
    array.each do |node|
      result += "<li"
      attributes = {}
      if block_given?
        text = yield(attributes, node)
      else
        text = node["title"]
      end
      attributes.each { |k,v| result += " #{k.to_s}='#{v.to_s}'"}
      result += ">\n"
      result += text
      result += menu_tag_builder(node["children"], &block)
      result += "</li>\n"
    end
    result += "</ul>"
    result
  end
  
  def menu_tag(array, &block)
    return "" if array.nil?
    haml_tag :ui do
      array.each do |node|
        attributes = {}
        if block_given?
          text = yield(attributes, node)
        else
          text = node[:title]
        end
        haml_tag :li, attributes do
          haml_concat text
          menu_tag_builder(node[:children], &block)
        end
      end
    end
  end

end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :fonts_dir, 'stylesheets/fonts'

# Add bower's directory to sprockets asset path
#after_configuration do
#  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
#  sprockets.append_path File.join "#{root}", @bower_config["directory"]
#end

# Add bower's directory to sprockets asset path

ready do
  sprockets.append_path File.join root, 'components'
end

#compass_config do |config|
#  config.sass_options = {:debug_info => true}
#end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.remote = "ods41-moda"
  deploy.branch = "master"
  deploy.strategy = :submodule
end
