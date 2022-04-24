import 'CoreLibs/animator'

class('IntroScreen').extends(Screen)

local gfx = playdate.graphics

local chain = AnimationChain(
    {
        {1000, 0, 1},
        {1000, 1, 1},
        {1000, 1, 0}
    }
)

function IntroScreen:init()
    self.backgroundImage = gfx.image.new( "SystemAssets/launchImage" )
    self.onAnimationEnd = nil
end

function IntroScreen:draw()
    self.backgroundImage:drawFaded(
        0,
        0,
        chain:currentValue(),
        playdate.graphics.image.kDitherTypeDiagonalLine
    )

    if chain:ended() and self.onAnimationEnd ~= nil then
        self.onAnimationEnd()
    end
end
