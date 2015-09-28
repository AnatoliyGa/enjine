###
  Simple state pattern implementation for game states.
  Code by Rob Kleffner, 2011
###

define ->
  class GameStateContext
    constructor: (defaultState) ->
      @state = null
      if defaultState?
        @state = defaultState
        @state.enter()

    changeState: (newState) ->
      if @state?
        @state.exit()
      @state = newState
      @state.enter()

    update: (delta) ->
      if @state?
        @state.checkForChange(@)
        @state.update(delta)

    draw: (delta) ->
      @state?.draw(delta);