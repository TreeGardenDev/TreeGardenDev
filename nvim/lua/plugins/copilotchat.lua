return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" },                                    -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" },                  -- for curl, log and async functions
        },
        build = "make tiktoken",                                             -- Only on MacOS or Linux
        opts = {
            log_path = vim.fn.stdpath('state') .. '/CopilotChat.log',        -- Default path to log file
            history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history

            question_header = '# User ',                                     -- Header to use for user questions
            answer_header = '# Copilot ',                                    -- Header to use for AI answers
            error_header = '# Error ',                                       -- Header to use for errors
            separator = '───',
            -- See Configuration section for options
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
}
