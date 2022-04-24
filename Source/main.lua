import "CoreLibs/sprites"
import "CoreLibs/graphics"
import 'CoreLibs/animator'
import "Input/input_handler"
import "Input/input_manager"
import "Screen/screen"
import "Menu/menu_option"
import "Menu/menu"
import "Animation/animation_chain"
import "menu_screen"
import "intro_screen"

local gfx = playdate.graphics

gfx.setColor(gfx.kColorBlack)

local menuScreen = MenuScreen()
local introScreen = IntroScreen()

local displayScreen = introScreen

function playdate.update()
    gfx.clear()
    displayScreen:draw()
end

function introScreen.onAnimationEnd()
    displayScreen = menuScreen
end
