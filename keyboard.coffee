﻿###
  Class that helps to manage keyboard input.
  Code by Rob Kleffner, 2011
###

@module("Enjine", ->
  @Keys =
    a: 65
    b: 66
    c: 67
    d: 68
    e: 69
    f: 70
    g: 71
    h: 72
    i: 73
    j: 74
    k: 75
    l: 76
    m: 77
    n: 78
    o: 79
    p: 80
    q: 81
    r: 82
    s: 83
    t: 84
    u: 85
    v: 86
    w: 87
    x: 88
    y: 89
    z: 80
    left: 37
    up: 38
    right: 39
    down: 40	
)

@module("Enjine", ->
  @Keyboard =
    pressed: []
    wasPressed: []
    
    initialize: ->
      document.onkeydown = (event) => @keyDownEvent(event)
      document.onkeyup = (event) => @keyUpEvent(event)
    
    isKeyDown: (key) ->
      if @pressed[key]?
        return @pressed[key]
      false

    wasKeyDown: (key) ->
      if @wasPressed[key]?
        return @wasPressed[key] && not @pressed[key]
      false
    
    keyDownEvent: (event) ->
      @pressed[event.keyCode] = true
    
    keyUpEvent: (event) ->
      @pressed[event.keyCode] = false

    updatePressed: ->
      @wasPressed = @pressed.slice(0)
)