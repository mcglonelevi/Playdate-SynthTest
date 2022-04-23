class('MenuScreen').extends(Screen)

local gfx = playdate.graphics

function MenuScreen:init()
    self.synth = playdate.sound.synth.new()
    self.mainMenu = Menu({
        MenuOption("Note"),
        MenuOption("Octave"),
    })
    self.noteMenu = Menu({
        MenuOption("C"),
        MenuOption("D"),
        MenuOption("E"),
        MenuOption("F"),
        MenuOption("G"),
        MenuOption("A"),
        MenuOption("B"),
    })
    self.octaveMenu = Menu({
        MenuOption("2"),
        MenuOption("3"),
        MenuOption("4"),
        MenuOption("5"),
        MenuOption("6"),
        MenuOption("7"),
        MenuOption("8"),
    })
    self.note = 'C';
    self.octave = '2';
    self.inputManager = InputManager(self.mainMenu)

    function self.mainMenu.onSelect(option)
        if option.text == "Note" then
            self.inputManager.inputHandler = self.noteMenu
        else
            self.inputManager.inputHandler = self.octaveMenu
        end
    end
    
    function self.noteMenu.onBack()
        self.inputManager.inputHandler = self.mainMenu
    end
    
    function self.octaveMenu.onBack()
        self.inputManager.inputHandler = self.mainMenu
    end
    
    function self.noteMenu.onSelect(option)
        self.note = option.text
        self.synth:playNote(
            self.note .. self.octave,
            1,
            1
        )
    end
    
    function self.octaveMenu.onSelect(option)
        self.octave = option.text
        self.synth:playNote(
            self.note .. self.octave,
            1,
            1
        )
    end 
end

function MenuScreen:draw()
    self.inputManager.inputHandler:draw()
    gfx.getSystemFont():drawText(
        "Note: " .. self.note .. self.octave,
        2,
        220
    )
end
