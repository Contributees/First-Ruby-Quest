# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'markdown-it', to: 'https://ga.jspm.io/npm:markdown-it@13.0.1/index.js'
pin 'entities/lib/maps/entities.json', to: 'https://ga.jspm.io/npm:entities@3.0.1/lib/maps/entities.json.js'
pin 'linkify-it', to: 'https://ga.jspm.io/npm:linkify-it@4.0.1/index.js'
pin 'mdurl', to: 'https://ga.jspm.io/npm:mdurl@1.0.1/index.js'
pin 'punycode', to: 'https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/punycode.js'
pin 'uc.micro', to: 'https://ga.jspm.io/npm:uc.micro@1.0.6/index.js'
pin 'uc.micro/categories/Cc/regex', to: 'https://ga.jspm.io/npm:uc.micro@1.0.6/categories/Cc/regex.js'
pin 'uc.micro/categories/P/regex', to: 'https://ga.jspm.io/npm:uc.micro@1.0.6/categories/P/regex.js'
pin 'uc.micro/categories/Z/regex', to: 'https://ga.jspm.io/npm:uc.micro@1.0.6/categories/Z/regex.js'
pin 'uc.micro/properties/Any/regex', to: 'https://ga.jspm.io/npm:uc.micro@1.0.6/properties/Any/regex.js'
pin 'trix'
pin '@rails/actiontext', to: 'actiontext.js'
