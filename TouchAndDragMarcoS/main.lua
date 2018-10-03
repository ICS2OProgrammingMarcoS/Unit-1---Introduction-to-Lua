-- Title: TouchAndDrag
-- Name: Marco Sterlini
-- Course: ICS2O
-- This Program displays images that react to a person's finger

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local varibles. 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local yellowGirl = display.newImageRect("Images/girl1.png", 150, 150)
local yellowGirlWidth = yellowGirl.width
local yellowGirlHeight = yellowGirl.height

local blueGirl = display.newImageRect("Images/girl5.png", 150, 150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height

-- my boolean varibles to keep track of which object I touched first
local alreadyTouchedYellowGirl = false
local alreadyTouchedBlueGirl = false

-- set the initial x and y position of myImage
yellowGirl.x = 400
yellowGirl.y = 500

blueGirl.x = 300
blueGirl.y = 200

-- function: BlueGirlListaner
-- Input: touch listaner
-- Output: None
-- Description: when Blus girl is touched, move her
local function BlueGirlListener(touch)

  if (touch.phase == "began") then
	    if (alreadyTouchedYellowGirl == false) then
		    alreadyTouchedBlueGirl = true
	    end
    end

    if( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
	 	blueGirl.x = touch.x
	 	blueGirl.y = touch.y
	end

 
    if (touch.phase == "ended") then
        alreadyTouchedBlueGirl = false
        alreadyTouchedYellowGirl = false
    end
end

local function YellowGirlListener(touch)

   if (touch.phase == "began") then
	    if (alreadyTouchedBlueGirl == false) then
		    alreadyTouchedYellowGirl = true
	    end
    end

	if( (touch.phase == "moved") and (alreadyTouchedYellowGirl == true) ) then
	 	yellowGirl.x = touch.x
	 	yellowGirl.y = touch.y
    end
 
    if (touch.phase == "ended") then
        alreadyTouchedYellowGirl = false
        alreadyTouchedBlueGirl = false
    end
end
-- add the respective listaners to each object
blueGirl:addEventListener("touch", BlueGirlListener)

yellowGirl:addEventListener("touch", YellowGirlListener)
