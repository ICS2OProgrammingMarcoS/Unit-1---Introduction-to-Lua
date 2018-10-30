-- Title: WhackAMole
-- Name: Marco Sterlini
-- Course: ICS2O
-- This program places a random object on the screen. If the user clicks on it in time, the score increases by one

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)


display.setDefault("background", 232/255, 0/255, 0/255)

-- creating Mole
local mole = display.newImage( "Images/mole.png" , 0, 0 )

	-- setting position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	mole:scale(0.4, 0.4)

	mole.isVisible = false

local pointSystem = 0
local pointsText = display.newText ( "Points = " .. pointSystem, 512, 100, nil, 70)
pointsText:setTextColor(0/255, 0/255, 200/255)

local moleSound = audio.loadSound( "Sounds/moleSound.wav" )
local moleSoundChannel

local bkgMusic = audio.loadSound( "Sounds/bkgMusic.mp3" )
local bkgMusicChannel = audio.play(bkgMusic)

-- this function thatmakes the mole appear in a random (x,y) position on the screen
-- before calling the hide function
function PopUp()

	-- chosing random Position on the screen between 0 and the size of the screen
	mole.x = math.random( 0, display.contentWidth)
	mole.y = math.random( 0, display.contentHeight)

	mole.isVisible = true

	timer.performWithDelay( 1050, Hide )
end



-- this function calls the PopUp function after 3 seconds
function PopUpDelay()
	timer.performWithDelay( 3050, PopUp )
end

-- this function makes the mole invisible and then calls the popupdelay function
function Hide()
	-- cahnging visibility
	mole.isVisible = false

	PopUpDelay()
end

-- this function starts the game
function GameStart()
	PopUpDelay()
end

-- this function increments the score only if the molw is clicked. It then displays the new score
function Whacked( event )
	-- if touch phase just started
	if (event.phase == "began") then
		pointSystem = pointSystem + 1
		pointsText.text =  "Points = " .. pointSystem
		moleSoundChannel = audio.play(moleSoundChannel)
	end
end

---------------------------------------- Event Listeners --------------------
-- I add the event Listener to the moles so that if the mole is touched, the Whacked function is called 
mole:addEventListener( "touch", Whacked )

-------------------------------start game -----------------------------
GameStart()