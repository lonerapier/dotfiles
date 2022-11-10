return {
	settings = {
		gopls = {
		  usePlaceholders = true,
		  gofumpt = true,
		  codelenses = {
			gc_details = true,
			test = true,
			tidy = true,
		  },
		  hints = {
			assignVariableTypes = true,
			compositeLiteralFields = true,
			constantValues = true,
			functionTypeParameters = true,
			parameterNames = true,
			rangeVariableTypes = true
		},
		  staticcheck = true,
		},
	},
}