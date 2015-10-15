class WelcomeController < ApplicationController
  def index
    @qr = RQRCode::QRCode.new('https://www.google.com')
  end

  def destroy
  end

  def edit
  end

  def show
  end
end
