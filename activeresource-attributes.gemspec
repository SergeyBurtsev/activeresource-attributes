Gem::Specification.new do |s|
  s.name        = "activeresource-attributes"
  s.version     = "0.0.1"
  s.authors     = ["Sergey Burtsev"]
  s.email       = "sergey@burtsev.com"
  s.homepage    = "https://github.com/SergeyBurtsev/activeresource-attributes"
  s.summary     = "ActiveResource attributes extension"
  s.description = "This ActiveResource extension which integrates ActiveModel::Attributes for type casting and default values."
  s.files       = ["lib/active_resource_attributes.rb"]

  s.add_dependency("activeresource")
  s.add_dependency("activemodel", ">= 5.2")
end
