class ReplicatePrediction
  attr_reader :record
  attr_writer :version, :inputs

  def initialize(record)
    @record = record
    @version = nil
    @inputs = {}
  end

  def process
    retrieve_model
    convert_to_base64
    send_request
  end

  private

    def retrieve_model
      # Retrieve the latest version of the model
      model = Replicate.client.retrieve_model("tencentarc/gfpgan")
      @version = model.latest_version
    end

    def convert_to_base64
      # Convert the document to base64 and pass it as img input
      document = record.document.download
      base64_image = Base64.strict_encode64(document)
      base64_image_url = "data:image/jpeg;base64,#{base64_image}"

      @inputs = {
          img: base64_image_url,
          version: "v1.4",
          scale: 2
        }
    end

    def send_request
      # Run prediction and capture the prediction ID and status of prediction
      prediction = @version.predict(@inputs, "https://#{ENV['NGROK_URL']}/replicate/webhook")
      record.update(prediction_id: prediction.id, status: prediction.status)
    end
end