class('Menu').extends(InputHandler)

local gfx = playdate.graphics

function Menu:init(options)
    Menu.super.init(self)

    self.options = options
    self.font = gfx.getSystemFont()
    self.fontSize = self.font:getHeight()
    self.offset = 2
    self.screenWidth = 400
    self.screenHeight = 240
    self.boxHeight = self.fontSize + (2 * self.offset)
    self.boxWidth = self.screenWidth - (2 * self.offset)
    self.selectedIndex = 1

    self.onSelect = nil
    self.onBack = nil
end

function Menu:draw()
    local count = 0

    -- gotta draw all the menu items
    for _, v in ipairs(self.options) do
        local boxY = self.offset + (count * (self.boxHeight + self.offset))
        local textY = boxY + (1.5 * self.offset)
        gfx.drawRoundRect(
            self.offset,
            boxY,
            self.boxWidth,
            self.boxHeight,
            self.offset
        )
        self.font:drawText(
            v.text,
            14 * self.offset, -- bump over the text a bit
            textY
        )
        count += 1
    end

    -- now we need to draw an asterisk to set the selected element
    self.font:drawText(
        '*',
        6 * self.offset, -- bump over the text a bit
        (4 * self.offset) + ((self.selectedIndex - 1) * (self.boxHeight + self.offset))
    )
end

function Menu:upButtonDown()
    self.selectedIndex = math.max(self.selectedIndex - 1, 1);
end

function Menu:downButtonDown()
    self.selectedIndex = math.min(self.selectedIndex + 1, #self.options);
end

function Menu:AButtonDown()
    if self.onSelect == nil then
        return
    end
    self.onSelect(self.options[self.selectedIndex])
end

function Menu:BButtonDown()
    if self.onBack == nil then
        return
    end
    self.onBack()
end
