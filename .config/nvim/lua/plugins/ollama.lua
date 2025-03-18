return {
  "nomnivore/ollama.nvim",
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
  cond = function()
    return not require("helper").check_work()
  end,
  opts = {
    model = "gemma3",
    url = "http://192.168.1.218:11434",
    prompts = {
      FG = {
        prompt =
        "You are a tech blogger please help fix the grammar and enhance the readability of the following text: \n$buf",
        action = "display",
      },
      GS = {
        prompt = "Validate that the grammar of the selected text is correct and makes sense: \n$sel",
        action = "display",
      },
      FC = {
        prompt = "You are an expert coder please help fix the following code: \n$sel",
        action = "display",
      },
      Trans = {
        prompt = "Translate the content to spanish while keeping it consistent and readable: \n$buf",
        action = "display",
      },
      EX = {
        prompt = "You are an expert coder please help explain this code in a very concise way: \n$sel",
        action = "display",
      },
    },
  },
}
