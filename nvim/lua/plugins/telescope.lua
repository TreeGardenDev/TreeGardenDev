return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = {
		'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
	},
	extensions = {
		fuzzy = true,
		override_generic_sorter = true,
		override_file_sorter = true,
		case_mode = "smart_case"
	}

}
