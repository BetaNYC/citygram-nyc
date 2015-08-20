require './app'

unprotected_routes = [
  Citygram::Routes::Analytics,
  Citygram::Routes::Events,
  Citygram::Routes::Publishers,
  Citygram::Routes::Subscriptions,
  Citygram::Routes::Digests
]

unprotected_routes << if ENV.fetch('ROOT_CITY_TAG', false)
  Citygram::Routes::Page
else
  Citygram::Routes::Pages
end

protected_routes = [
  Citygram::Routes::Unsubscribes
]

run Rack::URLMap.new(
  '/' => Rack::Cascade.new(unprotected_routes),
  '/assets' => Citygram::App.assets,
  '/protected' => Rack::Cascade.new(protected_routes),
)
