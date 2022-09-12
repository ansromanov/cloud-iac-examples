# Docs: https://terraspace.cloud/docs/config/reference/
Terraspace.configure do |config|

  logger = Logger.new($stdout)
  logger.level = :info
  config.logger = logger

  config.allow.envs = ["dev", "prod"]
  config.allow.regions = ["us-east-1", "eu-central-1"]

  config.test_framework = "rspec"
  config.all.concurrency = 5
  # To enable Terraspace Cloud
  # config.cloud.org = "ORG"          # required: replace with your org. only letters, numbers, underscore and dashes allowed
  # config.cloud.project = "main"     # optional. main is the default project name. only letters, numbers, underscore and dashes allowed

  # Uncomment to enable Cost Estimation. See: http://terraspace.cloud/docs/cloud/cost-estimation/
  # config.cloud.cost.enabled = true
end
