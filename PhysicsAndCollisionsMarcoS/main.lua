-----------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Marco Sterlini
-- Course: ICS2O
-- This program displays balls that roll down a ramp and hit a beam and stop

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()
-- Sounds
local bkgSound = audio.loadSound( "Sounds/bkgMusic.mp3" )
local bkgSoundChannel
bkgSoundChannel = audio.play(bkgSound)
---------------------------------------------------------------------------
-- Objects
---------------------------------------------------------------------------
-- Ground

local ground = display.newImage("Images/ground.png", 0, 0)

	-- set the x and y of the beam
	ground.x = display.contentWidth/2
	ground.y = display.contentHeight* 1 / 1

	-- change the width to be the same as the screen
	ground.width = display.contentWidth

	-- Add to physics
	physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

---------------------------------------------------------------------------
local beam = display.newImageRect("Images/beam.png", 80, 700)

	-- set the x and y position
	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65

	beam.x = display.contentWidth/8
	beam.y = display.contentHeight* 6 / 10

	-- rotate the beam - 60 degrees so its on an angle
	beam:rotate(150)

	-- send it to be the back layer
	beam:toBack()

	-- add to physics
	physics.addBody(beam, "static", {friction=0.4, bounce=0.3})

local beam2 = display.newImageRect("Images/beam.png", 80, 700)

	-- set the x and y position
	beam2.x = display.contentCenterX/5
	beam2.y = display.contentCenterY*1.65

	beam2.x = display.contentWidth/1.5
	beam2.y = display.contentHeight* 7 / 10

	-- rotate the beam - 60 degrees so its on an angle
	beam2:rotate(45)

	-- send it to be the back layer
	beam2:toBack()

	-- add to physics
	physics.addBody(beam2, "static", {friction=0.4, bounce=0.3})
-- create background
local bkg = display.newImage("Images/bkg.png")


	-- set the x and pos
	

	bkg.height = display.contentHeight

	bkg.width = display.contentWidth

	bkg.y = display.contentHeight/2

	bkg.x = display.contentWidth/2


	-- send to back
	bkg:toBack()

--------------------------------------------------------------------------
--FUNCTIONS
--------------------------------------------------------------------------

-- create the first ball
local function firstBall()

	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density=1.1, friction=0.4, bounce=0.94, radius=12.5})

	ball1:scale(0.5,0.5)
end

-------------------------------------------------------------------------

local function secondBall()

	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- adding to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.8, radius=50})

	ball2:scale(2,2)
	
end

-------------------------------------------------------------------------

local function thirdBall()

	-- creating first ball
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball3, {density=0.9, friction=0.4, bounce=0.25, radius=25})
end



------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond
------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
timer.performWithDelay(0, thirdBall)

