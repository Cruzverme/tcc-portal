class WelcomeController < ApplicationController
  def index
    @qr = RQRCode::QRCode.new('http://192.168.0.105:3000/')
  end

  def destroy
  end

  def edit
  end

  def show
  end
end
