--  Defaults
local tmux = vim.env.TMUX ~= nil and vim.env.TMUX or ""
local socket = vim.split(tmux, ",")[1]
local window = vim.fn.systemlist("tmux display-message -p '#I'")[1]
local pane = string.format("%s.2", window)

local M = { __target_socket = socket, __target_pane = pane, __escaped_strings = { "\\", ";", '"', "$", "'" } }

function M.setup(config)
  M.__target_socket = config.socket
  M.__target_pane = config.pane
  if config.escaped_strings ~= nil then
    M.configure_escape_strings(config.escaped_strings)
  end
  vim.print(string.format("socket: %s, pane: %s", M.__target_socket, M.__target_pane))
end

function M.sendText()
  local current_buffer = vim.api.nvim_get_current_buf()
  local start_line, start_col = unpack(vim.api.nvim_buf_get_mark(current_buffer, "<"))
  local end_line, end_col = unpack(vim.api.nvim_buf_get_mark(current_buffer, ">"))

  if start_line > end_line or (start_line == end_line and start_col > end_col) then
    start_line, end_line = end_line, start_line
    start_col, end_col = end_col, start_col
  end

  local lines = {}
  -- Add lines and remove escaped characters
  for line = start_line, end_line do
    local line_text = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]
    if line == start_line and line == end_line then
      line_text = string.sub(line_text, start_col + 1, end_col + 1)
    elseif line == start_line then
      line_text = string.sub(line_text, start_col + 1)
    elseif line == end_line then
      line_text = string.sub(line_text, 1, end_col + 1)
    end
    for _, substring in ipairs(M.__escaped_strings) do
      local escapedSubstring = string.gsub(substring, "[%(%)%.%%%+%-%*%?%[%]%^%$]", "%%%1")
      line_text = string.gsub(line_text, escapedSubstring, function(match)
        return "\\" .. match
      end)
    end
    table.insert(lines, line_text)
  end

  local text = table.concat(lines, "\n")
  print(text)
  local cmd = string.format('tmux -L %s send-keys -t %s -- "%s" Enter', M.__target_socket, M.__target_pane, text)
  vim.fn.systemlist(cmd)
end

return M
