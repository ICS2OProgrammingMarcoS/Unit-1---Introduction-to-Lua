-- Title: TouchAndReact
-- Course: ICS2O
-- This program displays an image and when you click on it a different image appers on the screen.

-- set background colour
display.setDefault ("background", 255/255, 0/255, 0/255)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make a varible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its position and make it visible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

local titleText = display.newText ("Touch and react", 512, 100, nil, 50)
titleText:setTextColor (0, 1, 4)

local textObject = display.newText ("Clicked!", 1024, 350, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false



-- Function: BlueButtonListener
-- input: Touch Listener
-- Output: none
-- Description: when blue button is clicked, it will apear with the red button,
-- and make the blue Button disapear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = false
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end
end
-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)

-- create checkmark, set its position and make it visible
local checkmark = display.newImageRect("Images/checkmark.png", 198, 96)
checkmark.x = 150
checkmark.y = 100
checkmark.isVisible = true