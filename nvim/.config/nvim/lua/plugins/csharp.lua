-- C# support: roslyn.nvim (LSP), csharpier (formatter), netcoredbg (debugger).
-- Requires the .NET SDK on the system (sudo pacman -S dotnet-sdk aspnet-runtime).
-- Note: the lazyvim lang.dotnet extra is NOT enabled on purpose; it uses OmniSharp.
return {
  -- Mason: add the community registry that ships the `roslyn` package
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ensure_installed = { "roslyn", "csharpier", "netcoredbg" },
    },
  },

  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "c_sharp" } } },

  -- Roslyn language server
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      filewatching = "auto",
    },
    init = function()
      vim.lsp.config("roslyn", {
        settings = {
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_parameters = true,
          },
          ["csharp|completion"] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
          },
          ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "fullSolution",
            dotnet_compiler_diagnostics_scope = "fullSolution",
          },
        },
      })
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { cs = { "csharpier" } } },
  },

  -- Debugging (nvim-dap itself comes from the dap.core extra)
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      dap.adapters.coreclr = {
        type = "executable",
        command = vim.fn.exepath("netcoredbg"),
        args = { "--interpreter=vscode" },
      }
      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch (pick dll)",
          request = "launch",
          program = function()
            -- build first so the dll is fresh
            vim.fn.system({ "dotnet", "build", "-v", "q" })
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
          cwd = "${workspaceFolder}",
        },
        {
          type = "coreclr",
          name = "Attach to process",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }
    end,
  },
}
