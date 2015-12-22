require "serialport"
require 'active_record'
require './request'

ActiveRecord::Base.establish_connection({adapter: "sqlite3", database: "dev.sqlite3"})

v1 = Request.average(:v1)
v2 = Request.average(:v2)
puts [v1.to_i,v2.to_i].inspect

#params for serial port
port_str = "/dev/ttyACM0"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

sp.puts [v1.to_i,v2.to_i].join(',') + "\n"
#just read forever
while true do
   while (i = sp.gets) do
      puts i
      #puts i.class #String
   end
end

sp.close
