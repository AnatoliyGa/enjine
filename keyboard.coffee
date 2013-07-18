###
  Class that helps to manage keyboard input.
  Code by Rob Kleffner, 2011
###

define ->
  class Keyboard
    @pressed: []
    @wasPressed: []
    
    @initialize: ->
      document.onkeydown = (event) => @keyDownEvent(event)
      document.onkeyup = (event) => @keyUpEvent(event)
    
    @isKeyDown: (key) ->
      if @pressed[key]?
        return @pressed[key]
      false

    @wasKeyDown: (key) ->
      if @wasPressed[key]?
        return @wasPressed[key] && not @pressed[key]
      false
    
    @keyDownEvent: (event) ->
      @pressed[event.keyCode] = true
    
    @keyUpEvent: (event) ->
      @pressed[event.keyCode] = false

    @updatePressed: ->
      @wasPressed = @pressed.slice(0)