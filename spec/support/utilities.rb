Dir[Rails.root.join("/app/helpers/**_helper.rb")].each do |f|
  require f
end
include ApplicationHelper