###
  Simple state pattern implementation for game states.
  Code by Rob Kleffner, 2011
###

define ->
  # Base game state class to at least ensure that all the necessary functions exist.
  class GameState
    enter: ->
    exit: ->
    update: ->
    draw: ->
    checkForChange: (context) ->