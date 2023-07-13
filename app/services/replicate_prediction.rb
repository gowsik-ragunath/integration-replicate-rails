class ReplicatePrediction
  attr_reader :record
  attr_writer :version, :inputs

  def initialize(record)
    @record = record
    @version = nil
    @inputs = {}
  end

  def process
    get_model
    convert_to_base64
    send_request
  end

  private

    def get_model
      model = Replicate.client.retrieve_model("tencentarc/gfpgan")
      @version = model.latest_version
    end

    def convert_to_base64
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
      @version.predict(@inputs, "https://#{ENV['NGROK_URL']}/replicate/webhook")
    end
end