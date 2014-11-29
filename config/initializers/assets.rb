
Rails.application.config.assets.precompile += [/.*\.js/,/.*\.css/]

Rails.application.config.assets.precompile += %w( forem.css )
Rails.application.config.assets.precompile += %w( forem.js )