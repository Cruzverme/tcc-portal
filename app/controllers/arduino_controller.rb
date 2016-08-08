class ArduinoController < WebsocketRails::BaseController

  def left
    @arduino = Arduino.new
    WebsocketRails[:updates].trigger(:update, @arduino.left)
  end

  def right
    @arduino = Arduino.new
    WebsocketRails[:updates].trigger(:update, @arduino.right)
  end

  def up
    @arduino = Arduino.new
    WebsocketRails[:updates].trigger(:update, @arduino.up)
  end

  def down
    @arduino = Arduino.new
    WebsocketRails[:updates].trigger(:update, @arduino.down)
  end

  def goodbye
    unless Arduino.first.count == 0
      Arduino.decrement_counter(:count,1)
    end
    @count = Arduino.first.count
    WebsocketRails[:updates].trigger(:update, @count)
  end
end