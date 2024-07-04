require 'faraday'

module Services
  class PotterDbService
    class << self
      def base_url
        'https://api.potterdb.com/v1'
      end

      def characters(link = "#{base_url}/characters")
        response = Faraday.get(link)

        if response.success?
          JSON.parse(response.body)
        else
          raise "Error: #{response.status} - #{response.body}"
        end
      end
    end
  end
end
