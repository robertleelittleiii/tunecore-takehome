  class Discog

    require 'uri'
    require 'net/http'
    require 'openssl'
    require 'json'

    attr_writer :api_key, :api_secret

    attr_reader :last_results

    API_URL = "https://api.discogs.com/".freeze


    def initialize (api_key, api_secret)
      @api_key = api_key
      @api_secret = api_secret
    end

    public

    def search(search_terms, page=1, result_count=50)
      search_response = api_call("search", {q: search_terms, pages: page, per_page: result_count})

      @last_results = JSON.parse(search_response.read_body)
      return @last_results
    end

    def get(object, object_id)
      search_response = api_call(object, object_id)
      begin
      @last_results = JSON.parse(search_response.read_body)
      rescue # just return a nil for now, no recovery.
        @last_results = nil
      end
      return @last_results

    end

    private

    def api_call(function, argument)
      case function
      when "search"
        url = URI("#{API_URL}/database/search?q=#{argument.to_a.map { |x| "#{x[0]}=#{x[1]}" }.join("&")}&key=#{@api_key}&secret=#{@api_secret}")
      else
        url = URI("#{API_URL}#{function}/#{argument}")
      end

      puts(url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(url)
      search_response = http.request(request)

    end

end


  