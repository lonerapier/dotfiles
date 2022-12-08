local status_ok, windex = pcall(require, "windex")
if not status_ok then
	return
end

windex.setup {
	default_keymaps = true, -- Enable default keymaps.
	save_buffers = true, -- Save buffers before closing them.
}