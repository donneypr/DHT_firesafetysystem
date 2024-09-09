
function [DisplayState] = InsideCondition(temperature,humidity)
unsafe = 40
if temperature >= 40 || humidity <= 40
    DisplayState = "The condition inside is not safe, please evacuate"
elseif temperature < unsafe || humidity > unsafe
        DisplayState = "The condition inside is safe and habitable" 
else 
    DisplayState = "Error, theres a mistake"
end    
end

