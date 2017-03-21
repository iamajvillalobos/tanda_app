class DatastreamsController < ApplicationController
  before_action :initialize_tanda_client

  def index
    @datastreams = @client.get_datastreams
  end

  private

  def initialize_tanda_client
    @client = Tanda.new("6cd1d12d43a44322a381899f6b4d2e5cdd0e4ba8bc723463f0e1bac870862257")
  end
end
