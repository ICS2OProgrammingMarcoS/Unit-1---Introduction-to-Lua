-- Title: Numeric TextField
-- Name: Marco Sterlini
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric textfield
-- terminal.
------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 0/255, 255/255, 0/255)

-- Local varibles 

local questionObject

local correctObject
local incorrectObject

local numericField

-- random numbers for calculations
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator

-- Points
local pointSystem = 0
local pointsTextObject

-- varibles for timer
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

-- lives and hearts
local lives = 4
local heart1
local heart2
local heart3
local heart4
 
local gameOver

---------------------------------------------------------------------
-- sounds
---------------------------------------------------------------------

local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundChannel
local incorrectSoundChannel
local incorrectSound = audio.loadSound( "Sounds/wrongSound.mp3" )
local endGameSound =  audio.loadSound( "Sounds/bensound-relaxing.mp3" )
local endGameSoundChannel
---------------------------------------------------------------------
-- local functions
---------------------------------------------------------------------
local function AskQuestion()
	-- generate 2 random questions between a max. and a min. number
	randomNumber1 = math.random(10, 20)
	randomNumber2 = math.random(10, 20)
	randomOperator = math.random(1, 3)

	if (randomOperator == 1) then
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
		correctAnswer = randomNumber1 + randomNumber2

	elseif (randomOperator == 2) then
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
		correctAnswer = randomNumber1 * randomNumber2

	elseif (randomOperator == 3) then
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
		correctAnswer = randomNumber1 - randomNumber2
	end
end

local function DecreaseLives()
	-- If there are no lives left, play a you lose sound, add a you lose image
	-- cancel the you lose timer remove the third heart
	if (lives == 3) then
		heart4.isVisible = false

	elseif (lives == 2) then	
		heart3.isVisible = false

	elseif (lives == 1) then 
		heart2.isVisible = false

	elseif (lives == 0) then
		heart1.isVisible = false
	--timer.cancel( countDownTimer )
		incorrectSoundChannel = audio.play(incorrectSoundChannel)
		
		gameOver = display.newImage("Images/gameOver.png")
		gameOver.height = display.contentHeight
		gameOver.width = display.contentWidth
		gameOver.y = display.contentHeight/2
		gameOver.x = display.contentWidth/2
	end
end

local function UpdateTime()

	secondsLeft = secondsLeft - 1

	clockText.text = "Time remaining: " .. secondsLeft

	if (secondsLeft == 0) then
		secondsLeft = totalSeconds
		lives = lives - 1
		DecreaseLives()
		UpdateTime()
		AskQuestion()
		--speedObject.isVisible = true
		speedSoundChannel = audio.play(speedSound)
		timer.performWithDelay(2000, HideSpeed)
	elseif (lives == 0) then
		numericField.isVisible = false
		endGameSoundChannel =  audio.play(endGameSound)
	end
end

local function StartTimer()
	-- create a countdown timer loops infinitley
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end



-- Local functions



-- hide the correct answer
local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end
-- hide incorrect answer
local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end


-- add the numeric text field 
local function NumericFieldListener( event )

	-- User begins edting "numericField"
	if ( event.phase == "began" ) then

	elseif (event.phase == "submitted") then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2000, HideCorrect)
			pointSystem = pointSystem + 1 
			pointsTextObject.text = ( "Points = " .. pointSystem)
			event.target.text = ""
		-- 
		else
			incorrectObject.isVisible = true
			incorrectSoundChannel = audio.play(incorrectSound)
			event.target.text = ""
			timer.performWithDelay(2000, HideIncorrect)
			lives = lives - 1
			DecreaseLives()
		end
	end
end



------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7



-- Object Creation

pointsTextObject = display.newText ( "Points = " .. pointSystem, 735, 255, nil, 60)
-- displays a question and sets the colour\
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/3, nil, 45)
questionObject:setTextColor(155/255, 42/255, 198/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/4, nil, 50)
correctObject:setTextColor(200/255, 0/255, 0/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/4, nil, 50)
incorrectObject:setTextColor(0/255, 0/255, 200/255)
incorrectObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/3, 150, 90 )
numericField.inputType = "number"
-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

clockText = display.newText ( " Time remaining: " .. secondsLeft, 512, 500, nil, 50 )
clockText:setTextColor(0/255, 0/255, 200/255)

-- Function Calls

-- call the function to ask the question
AskQuestion()

StartTimer()




