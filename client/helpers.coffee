Handlebars.registerHelper('session', (input)->
	return Session.get(input)
)