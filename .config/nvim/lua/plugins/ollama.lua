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
  },
  opts = {
    model = "codellama",
    url = "http://127.0.0.1:11434",
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
        model = "codellama",
      },
    },
  },
}
