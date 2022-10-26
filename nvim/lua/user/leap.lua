local status_ok, leap = pcall(require, "leap")
if not status_ok then
	print("aaaaaa")
	return
end

leap.set_default_keymaps()