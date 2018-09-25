-----------------------------------------------------------------------------------------
-- Title: Area Rectangle and Circle
-- Name: Marco Sterlini
-- This program shows you the area of a circle and shows you the area of a rectangle and also shows you the 
-- Course: ICS2O
-- This program displays a rectangle and shows its area

-- create my local varibles
local textSize = 35

local areaTextRect
local myRectangle 
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle

local areaTextCircle
local myCircle
local radius = 100
local areaOfCircle 

-- set the background colour of my screen.remember that colours are
display.setDefault("background", 232/255, 32/255, 32/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.X = 20
myRectangle.Y = 20

-- set the width of the border
myRectangle.strokeWidth = 15

-- set the colour of the rectangle
myRectangle:setFillColor(0, 0, 1)

-- set the colour of the border
myRectangle:setStrokeColor(0, 1, 0)

-- calculate the area\
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaTextRect = display.newText("The area of this rectangle with a width of \n" ..
    widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
    areaOfRectangle .." pixels².", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaTextRect.anchorX = 0
areaTextRect.anchorY = 0
areaTextRect.x = 20
areaTextRect.x = display.contentHeight/2

--set the colour of the newtext
areaTextRect:setTextColor(1, 1, 1)

myCircle = display.newCircle( 100, 100, radius )

myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = display.contentWidth / 6
myCircle.y = display.contentHeight / 2
myCircle.strokeWidth = 15
myCircle:setStrokeColor(0, 1, 0)

areaOfCircle = 3.14 * radius * radius

areaTextCircle = display.newText("The area of this circle with a radius of \n" ..
	 radius .. " and the area is " .. areaOfCircle .. " pixels².", 0, 0, Arial, textSize)

areaTextCircle.anchorX = 0
areaTextCircle.anchorY = 0
areaTextCircle.x = display.contentWidth / 2.5
areaTextCircle.y = display.contentHeight / 2

myCircle:setFillColor(0, 0, 1)