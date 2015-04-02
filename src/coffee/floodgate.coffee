class FloodGate

	constructor: (@json, @options) ->
		@defaultOptions =
			selectorBase: '.fg'
			separator: '-'
		if not @options?
			@options = @defaultOptions
		else
			if not @options.selectorBase?
				@options.selectorBase = @defaultOptions.selectorBase
			if not @options.separator?
				@options.separator = @defaultOptions.separator

	open: ->
		parse @options.selectorBase, @json

	parse: (selectorBase, json) =>
		for key, value of json
			if key? and key of json
				currentSelector = selectorBase + @options.separator + key
				if typeof value is 'object'
					@parse currentSelector, value
				else
					"FloodGate.parse: #{key} : #{value}"
					$ currentSelector
						.html value