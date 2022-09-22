module Terraspace::Project::TerraformVersionHelper
  def terraform_version
    map = {
      dev:  "1.2.8",
      prod: "1.1.9",
    }
    map[Terraspace.env.to_sym]
  end
end
