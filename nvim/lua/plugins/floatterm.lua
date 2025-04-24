local map = require("config.map")

return {
	{
		"voldikss/vim-floaterm",
		config = function()
			map.set("n", "TT", ":FloatermToggle <cr>")
			map.set(
				"n",
				"tc",
				":FloatermNew! --width=0.3 --wintype=vsplit --name=floaterm1 --position=rightbelow --autoclose=2 --disposable npmt <cr>"
			)
		end,
	},
}
