module Terraspace::Project::ProviderVersionHelper
  def provider_version
    map = {
      dev:  "4.31.0",
      prod: "4.28.0",
    }
    map[Terraspace.env.to_sym]
  end
end
