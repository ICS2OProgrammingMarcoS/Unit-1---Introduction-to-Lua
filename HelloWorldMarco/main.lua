-- Name: Marco Sterlini
--  Course: ICS2O/3C
-- This program displays Hello, World on the ipad simulator and "Hi!" to the command
-- terminal 
-----------------------------------------------------------------------------------------

-- print "Hello, World" to the command terminal
print ("***Hi!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display. setDefault("background", 100/255, 120/255, 34/255)

-- create a local varible
local textObject

-- displays text on the screen at position x = 500 and 500 with
-- a default font style and font size 70
textObject = display.newText( "Hello, Marco!", 400, 300, nil, 70 )

--sets the color of the text
textObject:setTextColor(222/255, 156/255, 245/255)


-- create a local varible
local textObjectSignature

-- display text on the screen at position x = 350, 250, nil, with
-- a default font style  and font size 50
textObjectSignature = display.newText ("By: Marco Sterlini", 400, 500, nil, 50 )


-- write to the console 
print("This is so fun!")