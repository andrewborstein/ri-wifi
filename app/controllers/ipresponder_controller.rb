class IpresponderController < ApplicationController
  def index
    # binding.pry  #Uncomment this to debug
    @array = [1,2,3,4]
    @ip = request.remote_ip
    render 'display_ip'
  end
end
