# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
# Rails.application.config.filter_parameters += [:password]

# tells Rails not to put passwords in the log files
Rails.application.config.filter_parameters << :password
