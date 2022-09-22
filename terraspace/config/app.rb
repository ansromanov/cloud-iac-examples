Terraspace.configure do |config|
  logger = Logger.new($stdout)
  logger.level = :info
  config.logger = logger

  config.allow.envs = ["dev", "prod"]
  config.allow.regions = ["eu-central-1"]

  config.test_framework = "rspec"
  config.all.concurrency = 5
end
