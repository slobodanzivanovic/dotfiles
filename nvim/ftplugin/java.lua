local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

local home = os.getenv "HOME"

local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local mason = require "mason-registry"
local jdtls_path = mason.get_package("jdtls"):get_install_path()

local equinox_launcher_path = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

-- change this based on system (linux, mac, win32)
local config_path = vim.fn.glob(jdtls_path .. "/config_mac")

local lombok_path = jdtls_path .. "/lombok.jar"

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local bundles = {
  vim.fn.glob(vim.env.HOME .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
}

vim.list_extend(bundles, vim.split(vim.fn.glob(vim.env.HOME .. "/.local/share/nvim/mason/share/java-test/*.jar"), "\n"))

local config = {
  cmd = {
    -- "java",
    vim.fn.expand "~/.sdkman/candidates/java/17.0.11-amzn/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx4g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. lombok_path,
    "-jar",
    equinox_launcher_path,
    "-configuration",
    config_path,
    "-data",
    workspace_dir,
  },

  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },
  capabilities = capabilities,

  settings = {
    java = {
      home = "~/.sdkman/candidates/java/17.0.11-amzn/bin/java",
      server = { launchMode = "Hybrid" },
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-17",
            path = "~/.sdkman/candidates/java/17.0.11-amzn",
          },
          {
            name = "JavaSE-21",
            path = "~/.sdkman/candidates/java/21.0.2-amzn",
          },
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all",
        },
      },
      format = {
        enabled = true,
      },
      completion = {
        maxResults = 20,
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
      saveActions = {
        organizeImports = true,
      },
      quickfix = {
        showAt = true,
      },
      guessMethodArguments = true,
      contentProvider = { preferred = "fernflower" },
      import = {
        gradle = { enabled = true },
        generatesMetadataFilesAtProjectRoot = true,
        maven = { enabled = true },
        exclusions = {
          "**/node_modules/**",
        },
      },
    },
    signatureHelp = {
      enabled = true,
      description = {
        enabled = true,
      },
    },
    extendedClientCapabilities = extendedClientCapabilities,
    redhat = { telemetry = { enabled = false } },
  },
  flags = {
    debounce_text_changes = 150,
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = bundles,
  },
}

config["on_attach"] = function(client, bufnr)
  jdtls.setup_dap { hotcodereplace = "auto" }
  require("jdtls.dap").setup_dap_main_class_configs()
end

jdtls.start_or_attach(config)

vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>")
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>")
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>")
vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>")
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>")

vim.keymap.set("n", "<leader>co", ":lua require'jdtls'.organize_imports()<CR>")
-- vim.keymap.set("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>")
-- vim.keymap.set("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")
vim.keymap.set("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
