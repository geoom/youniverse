
Raven.configure do |config|
	config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
	config.dsn = 'https://6c1fd2e775934f32b2b451e0a7615ae1:8e86a8103b8b4fb691dc8d3ac89acb02@app.getsentry.com/56724'
	config.environments = ['production']
end