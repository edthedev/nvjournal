local function new_note()
  local month = os.date("%m")
  local input = vim.fn.input("Topic: ")
  local linput = string.lower(input)
  local cleaned_input = string.gsub(linput, " ", "-")
  local filename = "~/Journal/" .. month .. "-" .. cleaned_input .. ".md"
  vim.cmd("edit " .. filename)
end

local function setup()
  vim.api.nvim_create_user_command("Note", new_note, {})
  vim.api.nvim_set_keymap("n", "<leader>j", ":Note<CR>", { noremap = true, silent = true })
end

return {
  setup = setup,
  new_note = new_note,
}
