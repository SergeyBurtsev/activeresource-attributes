Gem::Specification.new do |s|
  s.name          = "activeresource-attributes"
  s.version       = "0.0.3"
  s.authors       = ["Sergey Burtsev"]
  s.email         = "sergey@burtsev.com"
  s.homepage      = "https://github.com/SergeyBurtsev/activeresource-attributes"
  s.summary       = "ActiveResource attributes extension"
  s.description   = "This ActiveResource extension which integrates ActiveModel::Attributes for type casting and default values."
  s.license       = "MIT"

  s.files         = ["lib/active_resource_attributes.rb"]
  s.require_paths = ["lib"]

  s.add_runtime_dependency "activeresource", ">= 5.0"
  s.add_runtime_dependency "activemodel", ">= 5.2"
end
