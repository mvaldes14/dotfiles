return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    opts = {
        legacy_commands = false,
        ui = {
            enabled = true
        },
        workspaces = {
            {
                name = "wiki",
                path = function()
                    if vim.fn.hostname() == "nixos" then
                        return "/mnt/c/Users/migue/Documents/wiki"
                    else
                        return "~/Obsidian/wiki"
                    end
                end,
            },
        },
        completion = {
            blink = true,
            min_chars = 2,
        },
        note_id_func = function(title)
            return title
        end,
        new_notes_location = "00-Inbox",
        notes_subdir = "00-Inbox",
        daily_notes = {
            folder = "06-Journal",
            date_format = "%Y%m%d",
            default_tags = { "log" },
            template = "_templates/journal"
        },
        frontmatter = {
            enabled = false,
        },
        templates = {
            folder = "_templates",
            date_format = "%Y%m%d",
        },
        picker = {
            name = "snacks.pick",
        },
        search = {
            sort_by = "modified",
            sort_reversed = "true",
        }
    },
}
