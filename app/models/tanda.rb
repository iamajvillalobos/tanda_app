class Tanda
  def initialize(token)
    @token = token
    @base_url = "https://my.tanda.co/api/v2/"
    @auth = "Bearer " + @token
    @headers = {"Cache-Control"=> "no-cache", "Authorization"=> @auth}
  end

  def get_datastreams
    get("datastreams", @token)
  end

  def get_datastream(id)
    get("datastreams/#{id}", @token)
  end

  def create_datastream(body)
    post("datastreams", body)
  end

  def update_datastream(id, body)
    put("datastreams/#{id}", body)
  end

  def delete_datastream(id)
    delete("datastreams/#{id}")
  end

  private

  def post(extention, body)
    HTTParty.post(@base_url + extention, :headers => @headers, :query => body)
  end

  def get(extension, token)
    HTTParty.get(@base_url + extension, :headers => @headers).parsed_response
  end

  def put(extention, body)
    HTTParty.put(@base_url + extention, :headers => @headers, :query => body)
  end

  def delete(extension)
    HTTParty.delete(@base_url + extension, :headers => @headers)
  end
end