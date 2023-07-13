Replicate.client.api_token = ENV["REPLICATE_API_TOKEN"] 

class ReplicateWebhook
  def call(prediction)
    prediction
  end
end

ReplicateRails.configure do |config|
  config.webhook_adapter = ReplicateWebhook.new
end
