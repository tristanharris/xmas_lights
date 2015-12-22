require "serialport"

#params for serial port
port_str = "/dev/ttyACM0"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

sp.puts "50,50\n"
#just read forever
while true do
   while (i = sp.gets) do
      puts i
      #puts i.class #String
   end
end

sp.close
