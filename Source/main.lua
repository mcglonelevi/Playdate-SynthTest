import "CoreLibs/sprites"
import "CoreLibs/graphics"
import "Input/input_handler"
import "Input/input_manager"
import "Screen/screen"
import "Menu/menu_option"
import "Menu/menu"
import "menu_screen"

local gfx = playdate.graphics

gfx.setColor(gfx.kColorBlack)

local menuScreen = MenuScreen()

function playdate.update()
    gfx.clear()
    menuScreen:draw()
end
