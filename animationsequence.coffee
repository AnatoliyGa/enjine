###
  Class to represent an uninterrupted set of frames to animate.
  Code by Rob Kleffner, 2011
###

define ->
  class AnimationSequence
    constructor: (@startRow, @startColumn, @endRow, @endColumn) ->
      @singleFrame = @startRow is @endRow and @startColumn is @endColumn