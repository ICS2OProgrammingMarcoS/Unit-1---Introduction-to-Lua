-- Title: MovingImages
-- Name: Marco Sterlini
-- Course: ICS2O
-- This program displays an image that moves across the screen

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global varibles 
scrollSpeed = 3
scrollSpeed2 = 4
-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
 
-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)
-- character image with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)
-- set the image to be transparent
beetleship.alpha = 0
-- set image to apear 
rocketship.alpha = 1
-- set the inital x and y position of the beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- set the inital x and y position of the rocketship
rocketship.x = 1024
rocketship.y = display.contentHeight*2/3

-- make it point to the left
rocketship.xScale = -1
-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This functuion adds thye scroll speed to the x value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of thye ship every time it moves so that it fades out
    beetleship.alpha = beetleship.alpha + 0.01
    	beetleship:scale(1.002, 1.002)
    end
-- moveShip will be called over and over again 
Runtime:addEventListener("enterFrame", MoveShip)
-- Move ship
local function MoveRocketship(event)
	rocketship.x = rocketship.x - scrollSpeed2
	rocketship.alpha = rocketship.alpha - 0.001
	rocketship:scale(0.99777, 0.99777)
end
-- moveRocketship will be called over and over again
Runtime:addEventListener("enterFrame", MoveRocketship)
 




