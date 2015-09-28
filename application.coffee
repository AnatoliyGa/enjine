###
  A basic wrapper to get a game engine setup.
  Will be fine for most games.
  Code by Rob Kleffner, 2011
###

define (require) ->
  GameCanvas = require 'enjine/gamecanvas'
  GameStateContext = require 'enjine/gamestatecontext'
  GameTimer = require 'enjine/gametimer'
  Keyboard = require 'enjine/keyboard'
  Mouse = require 'enjine/mouse'

  class Application
    canvas: null
    timer: null
    stateContext: null

    constructor: ->
      @

    update: (delta) =>
      @stateContext.update(delta)
      @canvas.beginDraw()
      @stateContext.draw(@canvas.betterBuffer)
      @canvas.endDraw()

      Keyboard.updatePressed()
      Mouse.updatePressed()

    initialize: (canvasId, defaultState, resWidth, resHeight) =>
      @canvas = new GameCanvas()
      @timer = new GameTimer()
      Keyboard.initialize()
      Mouse.initialize(document.getElementById(canvasId))
      @canvas.initialize(canvasId, resWidth, resHeight)
      @timer.updateObject = this

      @stateContext = new GameStateContext(defaultState)

      @timer.start()