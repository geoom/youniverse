class TestJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
	  Rails.logger.debug "#{self.class.name}: I'm performing my job with arguments: #{args.inspect}"
  end
end

# rails runner "TestJob.perform_later(1,2,3)" && sleep 3 && tail -n 4 log/development.log