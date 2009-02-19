# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class RestrictedPageExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/restricted_page"
  
  # define_routes do |map|
  #   map.connect 'admin/restricted_page/:action', :controller => 'admin/restricted_page'
  # end
  
  def activate
    RestrictedPage
    # admin.tabs.add "Restricted Page", "/admin/restricted_page", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Restricted Page"
  end
  
end