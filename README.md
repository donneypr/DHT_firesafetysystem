# Fire Monitoring and Extinguishing System using MATLAB and Arduino
## Overview
This project implements a real-time fire detection and extinguishing system using MATLAB and Arduino. It integrates a temperature sensor, a humidity sensor, and actuators such as a water pump, buzzer, and LEDs. The system monitors the temperature and humidity inside a room to detect any fire hazards. If unsafe conditions are detected (high temperature or low humidity), the system triggers an alarm and activates a water pump to extinguish the fire.

## Features
- Temperature and Humidity Monitoring: Real-time monitoring of temperature and humidity using the DHT22 sensor.
- Fire Detection: Detects unsafe conditions (temperature >= 40°C or humidity <= 40%) and provides alerts.
- Actuation: Activates a water pump, buzzer, and LED light when a fire hazard is detected.
- Graphical Visualization: Displays real-time temperature, humidity, and light intensity data on a graph.
- Safety Feedback: Provides feedback on the current safety status of the monitored environment.
## Hardware Components
- Arduino Nano 3 (or compatible board)
- DHT22 Sensor (for temperature and humidity measurement)
- Water pump (actuator to extinguish the fire)
- Buzzer (alarm activation)
- LEDs (visual indication of fire detection)
- Light sensor (optional, for enhanced monitoring)
## Software Components
- MATLAB with Arduino Support Package
- Arduino IDE for loading the necessary libraries onto the Arduino board
## System Operation
### 1. Monitoring Mode:

- The system continuously monitors the temperature and humidity values.
- If the temperature is below 40°C and humidity is above 40%, the system deems the environment safe.
### 2. Fire Detection Mode:

- If the temperature exceeds 40°C or the humidity falls below 40%, the system detects a fire hazard.
- The water pump is activated to extinguish the fire.
- A buzzer sounds an alarm, and an LED lights up to indicate fire detection.
### 3. Graphical Display:

- The system provides a real-time graphical display of temperature, humidity, and light intensity values using animated lines in MATLAB.
## File Descriptions
```InsideCondition.m```
This script contains a function that takes the temperature and humidity as input and returns a message indicating whether the environment is safe or unsafe.

```matlab
function [DisplayState] = InsideCondition(temperature,humidity)
    unsafe = 40;
    if temperature >= 40 || humidity <= 40
        DisplayState = "The condition inside is not safe, please evacuate";
    elseif temperature < unsafe || humidity > unsafe
        DisplayState = "The condition inside is safe and habitable";
    else
        DisplayState = "Error, there's a mistake";
    end    
end
```
```MajorProjectEECS.m```
This script orchestrates the entire system. It creates an Arduino object, reads data from the DHT22 sensor, and activates the water pump, buzzer, and LEDs when unsafe conditions are detected. It also visualizes the temperature, humidity, and light data in real time.

## How to Run
1. Connect the sensors and actuators to the Arduino as per the specified pin configurations in the code.
2. Upload the required libraries onto the Arduino using the Arduino IDE.
3. Open the MATLAB scripts and ensure the Arduino is connected to the correct port.
4. Run the MajorProjectEECS.m script in MATLAB to start the system.
    Future Improvements
- Add support for more types of sensors (e.g., smoke or gas sensors) for better fire detection accuracy.
- Implement remote monitoring capabilities to alert users via SMS or email in case of fire detection.
- Include a web-based dashboard for real-time monitoring of the system.
## License
This project is licensed under the MIT License. See the LICENSE file for details.

