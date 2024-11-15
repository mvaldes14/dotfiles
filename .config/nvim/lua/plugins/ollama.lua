return {
  "nomnivore/ollama.nvim",
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
  opts = {
    model = "mistral",
    url = "http://192.168.1.218:11434",
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
      Translate = {
        prompt = "Translate the content to spanish: \n$buf",
        action = "display",
        model = "mistral",
      },
    },
  },
}
