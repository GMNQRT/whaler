SimpleNavigation::Configuration.run do |navigation|
  prefix = "/#!/"
  navigation.selected_class = 'current'
  navigation.items do |primary|
    primary.dom_class = 'nav navbar-nav'
    primary.item :home, 'Home', prefix
    primary.item :container, 'Conteners', prefix + "container"
    primary.item :image, 'Images', prefix + "images"
  end
end