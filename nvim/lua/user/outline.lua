local status_ok, outline = pcall(require, "symbols-outline")
if not status_ok then
  return
end

--## Default keymaps
-- | Key        | Action                                             |
-- | ---------- | -------------------------------------------------- |
-- | Escape     | Close outline                                      |
-- | Enter      | Go to symbol location in code                      |
-- | o          | Go to symbol location in code without losing focus |
-- | Ctrl+Space | Hover current symbol                               |
-- | K          | Toggles the current symbol preview                 |
-- | r          | Rename symbol                                      |
-- | a          | Code actions                                       |
-- | h          | Unfold symbol                                      |
-- | l          | Fold symbol                                        |
-- | W          | Fold all symbols                                   |
-- | E          | Unfold all symbols                                 |
-- | R          | Reset all folding                                  |
-- | ?          | Show help message                                  |

outline.setup()
