SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'current'
  navigation.items do |primary|
    primary.dom_class = 'nav'
    primary.item :home, "#{fa_icon("th-large")} Dashboard".html_safe, '/', html: { data: { 'ng-class' => '{ active: controller == "homeCtrl"}'  }}
    primary.item :container, "#{fa_icon("tasks")} Containers".html_safe, "/container", html: { data: { 'ng-class' => '{ active: controller == "containerCtrl"}'  }}
    primary.item :image, "#{fa_icon("picture-o")} Images".html_safe, "/images", html: { data: { 'ng-class' => '{ active: controller == "imageCtrl"}'  }}
    primary.item :logout, "#{fa_icon("sign-out")} Sign out".html_safe, "/signout"
  end

end