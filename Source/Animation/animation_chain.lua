class('AnimationChain').extends(Object)

local gfx = playdate.graphics

-- options is an array of arrays where each sub-array has the args for corelibs animator
function AnimationChain:init(options)
    self.animationIndex = 1
    self.animations = options
    self.currentAnimation = nil
end

function AnimationChain:currentValue()
    if self.currentAnimation == nil then
        self.currentAnimation = gfx.animator.new(
            table.unpack(self.animations[self.animationIndex])
        )
        self.animationIndex += 1
    end

    if self.currentAnimation:ended() and self.animationIndex <= #self.animations then
        self.currentAnimation = gfx.animator.new(
            table.unpack(self.animations[self.animationIndex])
        )
        self.animationIndex += 1
    end

    return self.currentAnimation:currentValue()
end

function AnimationChain:ended()
    if self.animationIndex <= #self.animations then
       return false
    end

    return self.currentAnimation:ended()
end
