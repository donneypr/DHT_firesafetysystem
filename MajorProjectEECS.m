clear all;
close all;

unsafe = 40;
x = 0;
% Create arduino object with the add-on library 
a = arduino('/dev/cu.usbserial-0001', 'Nano3', 'Libraries', 'Adafruit/DHT22'); 
% Create DHT22 sensor object 
sensor = addon(a, 'Adafruit/DHT22', 'D3'); 
% Read temperature measurement 

figure
h = animatedline;
h2 = animatedline("Color",'b')
h3 = animatedline("Color",'r')
ax = gca;
ax.YGrid = 'on';
ax.YLim = [-0.1 100];
title('Humidity, Temperature and Light sensor');
ylabel('Y axis');
xlabel('Time');
stop = false;
startTime = datetime('now');

while x == 0
  temperature = readTemperature(sensor)
  humidity = readHumidity(sensor)
  light = readVoltage(a,'A1');
  %Call in the function
  
  DisplayState = InsideCondition(temperature,humidity)
  disp(DisplayState)
 if (temperature >= unsafe) || (humidity <= unsafe)  
     %Activate the water pump
     writeDigitalPin(a,'D2',1);
     %Activate buzzer and LED
     writePWMDutyCycle(a,'D5',0.67)
     writeDigitalPin(a,'D4',1)
     
 elseif (temperature < unsafe) || (humidity > unsafe) 
     writeDigitalPin(a,'D2',0);
     writePWMDutyCycle(a,'D5',0)
     writeDigitalPin(a,'D4',0)    
 else 
     disp("error")
 end
     
% Read current temperature value
 temperature = readTemperature(sensor);
 humidity = readHumidity(sensor);
 
 % Get current time
 t = datetime('now') - startTime;
 % Add points to animation
 addpoints(h,datenum(t),temperature)
 addpoints(h2,datenum(t),humidity)
 addpoints(h3,datenum(t),light*10)
 % Update axes
 ax.XLim = datenum([t-seconds(15) t]);
 datetick('x','keeplimits')
 drawnow
 
end 


