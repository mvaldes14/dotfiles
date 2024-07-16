return {
  "nomnivore/ollama.nvim",
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
  keys = {
    {
      "<leader>oo",
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = "ollama prompt",
      mode = { "n", "v" },
    },
    { "<leader>oe", "<cmd>Ollama Explain_Code<cr>", desc = "Ollama Explain Code", mode = "v" },
    { "<leader>of", "<cmd>Ollama Fix_Code<cr>", desc = "Ollama Fix Code", mode = "v" },
    { "<leader>og", "<cmd>Ollama Fix_grammar<cr>", desc = "Ollama Fix Grammar", mode = "v" },
  },
  opts = {
    model = "mistral",
    url = "http://192.168.1.206:11434",
    prompts = {
      Fix_Grammar = {
        prompt = "Fix the grammar and enhance the readability of the following text: \n$buf",
        action = "replace",
        model = "mistral",
      },
      Grammar_Selection = {
        prompt = "Validate the grammar of the selected text: \n$sel",
        action = "display",
        model = "mistral",
      },
      Fix_Code = {
        prompt = "Fix the code provided: \n$sel",
        action = "display",
        model = "mistral",
      },
    },
  },
}
