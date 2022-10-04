local M = {

	new_hlgroups = {
		-- Neorg

		HlSearchLens = {
			bg = "red",
		},
		LspInlayHint = {
			bg = "#393C4C",
			fg = "#A7A8AC",
		},
		IlluminatedWordText = {
			bg = "#353941",
		},
		IlluminatedWordRead = {
			bg = "#353941",
		},
		IlluminatedWordWrite = {
			bg = "#575fcf",
			underline = false,
		},
		KeyMenuFloatBorder = {

			fg = "#BD93F9",
			bg = "none",
			bold = true,
		},
		IndentBlanklineIndent1 = {
			fg = "#E06C75",
			bold = true,
		},
		IndentBlanklineIndent2 = {
			fg = "#E5C07B",
			bold = true,
		},
		IndentBlanklineIndent3 = {
			fg = "#98C379",
			bold = true,
		},
		IndentBlanklineIndent4 = {
			fg = "#56B6C2",
			bold = true,
		},
		IndentBlanklineIndent5 = {
			fg = "#61AFEF",
			bold = true,
		},
		IndentBlanklineIndent6 = {
			fg = "#C678DD",
			bold = true,
		},
		BufferTabpageFill = {
			fg = "none",
			bg = "none",
		},
		FoldColumn = {
			bg = "none",
		},
		BufferInactive = {
			fg = "none",
			bg = "none",
		},
		BufferInactiveSign = {
			fg = "none",
			bg = "none",
		},
		StatusLine = {

			fg = "none",
			bg = "none",
		},
		CmpDocBorder = {

			fg = "#5e5f69",
			bg = "none",
		},
		NeorgCodeBlock = { bg = "darkerblack" },

		FloatBorder = { fg = "#BD93F9" },

		-- unordered lists
		NeorgUnorderedList1 = { fg = "grey" },
		NeorgUnorderedList2 = { fg = "grey" },
		NeorgUnorderedList3 = { fg = "grey" },
		NeorgUnorderedList4 = { fg = "grey" },
		NeorgUnorderedList5 = { fg = "grey" },
		NeorgUnorderedList6 = { fg = "grey" },

		-- headings
		NeorgHeading1Title = { fg = "white", bold = true },
		NeorgHeading1Prefix = { fg = "white", bold = true },

		NeorgHeading2Title = { fg = "red", bold = true },
		NeorgHeading2Prefix = { fg = "red", bold = true },

		NeorgHeading3Title = { fg = "green", bold = true },
		NeorgHeading3Prefix = { fg = "green", bold = true },

		NeorgHeading4Title = { fg = "blue", bold = true },
		NeorgHeading4Prefix = { fg = "blue", bold = true },

		NeorgHeading5Title = { fg = "purple", bold = true },
		NeorgHeading5Prefix = { fg = "purple", bold = true },

		NeorgHeading6Title = { fg = "yellow", bold = true },
		NeorgHeading6Prefix = { fg = "yellow", bold = true },

		NeorgMarkUpBold = {
			fg = "red",
			bold = true,
		},

		FakeLineNr = {
			fg = "black",
			bg = "black",
		},
	},

	overriden_hlgroups = {
		AlphaHeader = {
			fg = "blue",
		},
		CmpDocBorder = {

			fg = "#BD93F9",
			bg = "none",
		},
		LspInlayHint = {
			bg = "#393C4C",
			fg = "#A7A8AC",
		},

		KeyMenuFloatBorder = {

			fg = "#BD93F9",
			bg = "none",
		},
		StatusLine = {
			fg = "none",
			bg = "none",
		},
		statusline = {
			fg = "none",
			bg = "none",
		},
		IlluminatedWordText = {
			bg = "#353941",
		},
		HlSearchLens = {
			bg = "red",
		},
	},
}

return M
