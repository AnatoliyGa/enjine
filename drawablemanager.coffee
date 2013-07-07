###
	Class to help manage and draw a collection of sprites.
	Code by Rob Kleffner, 2011
###

@module("Enjine", ->
	class @DrawableManager
		constructor: ->
			@unsorted = true
			@objects = []

		add: (objs) ->
			if objs instanceof Array
				@objects = @objects.concat(objs)
			else
				@objects.push(objs)
			@unsorted = true
			@

		clear: ->
			@objects = []
			@

		contains: (obj) ->
			i = @objects.length
			while i -= 1
				if (@objects[i] is obj)
					true
			false

		# `obj` can be either the first index or the object(s) to remove
		remove: (obj, indexTwo) ->
			if obj instanceof Enjine.Drawable
				@objects[t..t] = [] if (t = @objects.indexOf(obj)) > -1
			else if obj instanceof Array
				@remove(item) for item in obj
			else
				@objects[obj...indexTwo] = []
			@

		update: (delta) ->
			(item.update?(delta))	for item in @objects

		draw: (context, camera) ->
			if @unsorted
				@unsorted = false
				@objects.sort((x1, x2) -> return x1.zOrder - x2.zOrder )

			item.draw?(context, camera) for item in @objects
)