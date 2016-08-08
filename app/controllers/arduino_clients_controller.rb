class ArduinoClientsController < ApplicationController
  def index
    @arduinos = Arduino.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destoy
  end
end
