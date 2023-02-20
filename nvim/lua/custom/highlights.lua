local M = {

	new_hlgroups = {

		BufferCurrent = {
			fg = "red",
		},

		BufferInactive = {
			fg = "#222533",
		},

		CmpItemKindClass = {
			bg = "cyan",
			fg = "#222533",
		},

		CmpItemKindEnum = {
			bg = "orange",
			fg = "#222533",
		},

		CmpItemKindEnumDefault = {
			bg = "orange",
			fg = "#222533",
		},

		CmpItemKindEnumMember = {
			bg = "orange",
			fg = "#222533",
		},

		CmpItemMenu = {
			bg = "none",
			fg = "#666771",
		},

		NotifyBackground = {
			bg = "red",
		},

		NeoTreeTabActive = {

			bg = "none",
			fg = "red",
		},
		NeoTreeTabInactive = {
			bg = "#000000",
			fg = "#666771",
		},
		-- Neorg

		HlSearchLens = {
			bg = "red",
		},
		LspInlayHint = {
			bg = "none",
			fg = "#A7A8AC",
			bold = true,
			italic = true,
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

	overridden_hlgroups = {
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
		NeoTreeTabActive = {

			bg = "none",
			fg = "red",
		},
		NeoTreeTabInactive = {
			bg = "#000000",
			fg = "#666771",
		},
		NotifyBackground = {
			bg = "red",
		},
		CmpItemKind = {
			bg = "orange",
			fg = "#222533",
		},
		CmpItemKindText = {
			bg = "yellow",
			fg = "#222533",
		},

		CmpItemKindField = {
			bg = "purple",
			fg = "#222533",
		},
		CmpItemKindMethod = {
			bg = "green",
			fg = "#222533",
		},
		CmpItemKindFunction = {
			bg = "green",
			fg = "#222533",
		},
		CmpItemKindClass = {
			bg = "cyan",
			fg = "#222533",
		},
		CmpItemKindConstant = {
			bg = "orange",
			fg = "#222533",
		},
		CmpItemKindEventDefault = {
			bg = "cyan",
			fg = "#222533",
		},
		CmpItemKindEvent = {
			bg = "cyan",
			fg = "#222533",
		},

		CmpItemKindDefault = {
			bg = "cyan",
			fg = "#222533",
		},

		CmpItemKindValue = {
			bg = "orange",
			fg = "#222533",
		},

		CmpItemKindVariable = {
			bg = "pink",
			fg = "#222533",
		},
		CmpItemKindInterface = {
			bg = "orange",
			fg = "#222533",
		},
		CmpItemKindEnum = {
			bg = "orange",
			fg = "#222533",
		},

		CmpItemKindEnumDefault = {
			bg = "orange",
			fg = "#222533",
		},

		CmpItemKindClassDefault = {
			bg = "orange",
			fg = "#222533",
		},
		CmpItemKindSnippet = {
			bg = "red",
			fg = "#222533",
		},
		CmpItemKindConstructor = {
			bg = "blue",
			fg = "#222533",
		},
		CmpItemKindFile = {
			bg = "white",
			fg = "#222533",
		},
		CmpItemKindColor = {
			bg = "red",
			fg = "#222533",
		},
		CmpItemKindFolder = {
			bg = "white",
			fg = "#222533",
		},
		CmpItemKindIdentifier = {
			bg = "purple",
			fg = "#222533",
		},
		CmpItemKindKeyword = {
			bg = "white",
			fg = "#222533",
		},
		CmpItemKindModule = {
			bg = "cyan",
			fg = "#222533",
		},
		CmpItemKindProperty = {
			bg = "purple",
			fg = "#222533",
		},
		CmpItemKindReference = {
			bg = "white",
			fg = "#222533",
		},
		CmpItemKindStruct = {
			bg = "pink",
			fg = "#222533",
		},
		CmpItemKindType = {
			bg = "cyan",
			fg = "#222533",
		},
		CmpItemKindTypeParameter = {
			bg = "purple",
			fg = "#222533",
		},
		CmpItemKindOperator = {
			bg = "white",
			fg = "#222533",
		},

		CmpItemKindEnumMember = {
			bg = "orange",
			fg = "#222533",
		},
		CmpItemKindUnit = {
			bg = "pink",
			fg = "#222533",
		},

		CmpItemMenu = {
			bg = "none",
			fg = "#222533",
		},
		BufferCurrent = {
			fg = "red",
		},

		BufferInactive = {
			fg = "#222533",
		},
	},
}

return M
