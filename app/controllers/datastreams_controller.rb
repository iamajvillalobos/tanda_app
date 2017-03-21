class DatastreamsController < ApplicationController
  before_action :initialize_tanda_client

  def index
    @datastreams = @client.get_datastreams.map { |d| d.symbolize_keys }
  end

  def new
    @intervals = [
      ['1 day', 86400],
      ['1 hr', 3600],
      ['30 min', 1800],
      ['15 min', 900]
    ]
  end

  def create
    datastream = @client.create_datastream(build_payload)
    redirect_to datastreams_path
  end

  def destroy
    response = @client.delete_datastream(params[:id])
    flash[:info] = "Datastream is queued for deletion. It may take a while."
    redirect_to datastreams_path
  end

  private

  def initialize_tanda_client
    @client = Tanda.new("6cd1d12d43a44322a381899f6b4d2e5cdd0e4ba8bc723463f0e1bac870862257")
  end

  def build_payload
    { 
      name: params[:name],
      data_interval: params[:interval]
    }
  end
end
