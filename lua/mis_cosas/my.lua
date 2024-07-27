-- T es una variable global, por lo cual
-- puedo llamarma de cualquier lado.
My_shit = {}

function My_shit.pete()
	print("(☞⌐▀͡ ͜ʖ͡▀ )☞  -- YO-MAMA")
end

function My_shit.see_the_fucking_comments(color)
	if color == nil then
		color = "#888888"
	end
	vim.cmd.highlight({ "Comment", "guifg=" .. color })
end

return My_shit
