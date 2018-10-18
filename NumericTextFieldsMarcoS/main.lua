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
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAwnser
local incorrectAnswer
local incorrectObject
local randomOperator
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundChannel
local incorrectSoundChannel
local incorrectSound = audio.loadSound( "Sounds/wrongSound.mp3" )
local pointSystem = 0
local pointsTextObject
-- Local functions

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


local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrectAnswer()
	incorrectObject.isVisible = false
	AskQuestion()
end

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
			timer.performWithDelay(2000, HideIncorrectAnswer)	
		end
	end
end

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

-- Function Calls

-- call the function to ask the question
AskQuestion()