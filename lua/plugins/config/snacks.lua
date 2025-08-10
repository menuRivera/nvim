require('snacks').setup {
	lazygit = { configure = false },
	quickfile = {},
	bigfile = {},
	dim = {},
	dashboard = {
		preset = {
			header = [[
  .,;::clllcc:,'.
  'oOK000K0OOOOOOOOOOOxo;
	'x000OOOOOOOOOOOOOOOOOOOxl.
   c00OOOkkkkkkkkkkOOOOOOOOkool.
	  .kxddooolllllloooooddxxxdoooc;,.
	  col:;;,'''''''',,;;::clooooc;;;;;.
	  ;,'''''';dkkoc,''''''''',;;;;;;;;;.
	  .''''''lKKKOOko,'''''''''';;;;;;;;;
	   ;clooxKK0OOkoo:;cloddoc;',;;;;;;;;
	   xkOkd0KOOOxoc;:odkO00OOOd;;;;;;;;;.
	 .OKOOkK0OOOdo:;;ookO0OOOOOl;;;;;;;;;.
	,OOOO0K0OOkdc;;;;coxOOOOOOk;;;;;;;;;;.
	OOO0KKOOOkoooddoc;coxOOOOOo;;;;;;;;;;.
   oOO000OOkxooxOOkxdl;;odkOOO:;;;;;;;;;;.
   OOxolcc::::cloooooo:;coodkx;;;;;;;;;;;.
   OOl;',;;,''',;:ccc:;;looooc;;;;;;;;;;;.
  .OOOOxoolllc:;::::::cloooooc;;;;;;;;;;;'
  'OOO00OOOOOOOkdoooooooooooo:;;;;;;;;;;;;
  ;Oxocc:::::cclodooooooooooo:;;;;;;;;;;;.
  ;kcccccccccccclcc:loooooooo:;;;;;;;;;;
  ;Okdlc:;;;;:clodxxxooooooooc;;;;;;.
  ;OOOxoooooooooxOOOOkoooooooc;;;;;;,
  :OOOOkdooooodkOOOOOOoooooooc;;;;;;;
  kOOOOOOOkkkOOOOOOOOOxoooooo:;;;;;;;
  OOOOOO00OOOOOOOOOOOOkoooooo:;;;;;;;
 .dkkOOO00OOOOOOOOOOOkxoooool;;;;;;;.
   .ooddddxxxddddddooooooolc;;;,
					]]
		},
		sections = {
			{ section = "header" },
			-- { section = "terminal", cmd = "cbonsai -l", hl = "header", padding = 1, indent = 0, height = 25 },
			-- { section = "terminal", cmd = "cowsay $(fortune -s)", hl = "header", padding = 1, indent = 10 },
			{ section = "startup", icon = "" },
			function()
				local cwd = vim.fn.getcwd()
				local parent_dir, project_name = string.match(cwd, "(.-)/([^/]+)$")

				if parent_dir == nil then
					-- Handle the case where there's no slash (e.g., if cwd is just "/")
					parent_dir = ""
					project_name = cwd
				end

				return {
					align = "center",
					text = {
						{ "at " .. parent_dir .. "/", hl = "footer" },
						{ project_name,               hl = "special" },
						-- { cwd,                        hl = "special" },
					},
				}
			end
		},
	}
}
