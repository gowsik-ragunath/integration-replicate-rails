Replicate.client.api_token = ENV["REPLICATE_API_TOKEN"] 

class ReplicateWebhook
  def call(prediction)
    runner = Runner.find_by(prediction_id: prediction.id)
    return if runner.nil?

    runner.update(status: prediction.status, output: prediction.output)
  end
end

ReplicateRails.configure do |config|
  config.webhook_adapter = ReplicateWebhook.new
end
