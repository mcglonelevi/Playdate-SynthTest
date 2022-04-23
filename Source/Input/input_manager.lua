class('InputManager').extends(Object)

function InputManager:init(inputHandler)
    self.inputHandler = inputHandler
    
    function playdate.downButtonDown()
        self.inputHandler:downButtonDown()
    end
    
    function playdate.leftButtonDown()
        self.inputHandler:leftButtonDown()
    end
    
    function playdate.rightButtonDown()
        self.inputHandler:rightButtonDown()
    end
    
    function playdate.upButtonDown()
        self.inputHandler:upButtonDown()
    end
    
    function playdate.AButtonDown()
        self.inputHandler:AButtonDown()
    end
    
    function playdate.BButtonDown()
        self.inputHandler:BButtonDown()
    end
    
    function playdate.downButtonUp()
        self.inputHandler:downButtonUp()
    end
    
    function playdate.leftButtonUp()
        self.inputHandler:leftButtonUp()
    end
    
    function playdate.rightButtonUp()
        self.inputHandler:rightButtonUp()
    end
    
    function playdate.upButtonUp()
        self.inputHandler:upButtonUp()
    end
    
    function playdate.AButtonUp()
        self.inputHandler:AButtonUp()
    end
    
    function playdate.BButtonUp()
        self.inputHandler:BButtonUp()
    end
end
