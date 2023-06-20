Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:8080' # Replace this with the address of your Vue.js app
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :delete, :options]
  end
end
