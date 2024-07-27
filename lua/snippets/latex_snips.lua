local ls = require("luasnip") --{{{

local s = ls.snippet
local n = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local date = function()
	return os.date("%d/%m/%Y")
end
ls.add_snippets(nil, {

	tex = {
		-- Enumerate con label
		s(
			{
				trig = "enumLabel",
				name = "enumerateLabel",
				desc = "\\begin{enumerate}[label=<++>*)] \n \\end{enumerate}",
			},
			fmt(
				"\\begin{{enumerate}}[label={iNode1}*)] \n \\item {iNode2} \n \\end{{enumerate}}",
				{ iNode1 = i(1, "<+ label +>"), iNode2 = i(2, "<+ acá se escribe +>") }
			)
		),

		-- llave
		s(
			{
				trig = "llave",
				name = "llave",
				desc = "\\begin{{llave}{l}\n{ \n }",
			},
			fmt(
				"\\llave{{{iNode1}}}{{\n {iNode2} \n}}",
				{ iNode1 = i(1, "<+align+>"), iNode2 = i(2, "<+ acá se escribe +>") }
			)
		),

		-- Fracciones
		s(
			{
				trig = "frac",
				name = "fracciones",
				desc = "\\frac{NUM}{DEN}",
			},
			fmt(
				"\\frac{{{iNode1}}}{{{iNode2}}} {iNode3}",
				{ iNode1 = i(1, "<+NUM+>"), iNode2 = i(2, "<+DEN+>"), iNode3 = i(3, "<+OUT+>") }
			)
		),

		-- Congruencia
		s(
			{
				trig = "cong",
				name = "congruencia",
				desc = "\\congruencia{a}{r}{d}",
			},
			fmt("\\congruencia{{{iNode1}}}{{{iNode2}}}{{{iNode3}}} {iNode4}", {
				iNode1 = i(1, "<+a+>"),
				iNode2 = i(2, "<+r+>"),
				iNode3 = i(3, "<+d+>"),
				iNode4 = i(4, "<+OUT+>"),
			})
		),
	},
})
