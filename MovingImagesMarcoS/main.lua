-- Title: MovingImages
-- Name: Marco Sterlini
-- Course: ICS2O
-- This program displays an image that moves across the screen

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global varibles 
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
 
-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the inital x and y position of the beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This functuion adds thye scroll speed to the x value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of thye ship every time it moves so that it fades out
    beetleship.alpha = beetleship.alpha + 0.01
end
-- moveShip will be called over and over again 
Runtime:addEventListener("enterFrame", MoveShip)