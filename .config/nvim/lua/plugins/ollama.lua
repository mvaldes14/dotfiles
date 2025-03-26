return {
  "nomnivore/ollama.nvim",
  cmd = { "Ollama", "OllamaModel" },
  cond = function()
    return not require("helper").check_work()
  end,
  opts = {
    model = "gemma3:4b",
    url = "http://192.168.1.218:11434",
    prompts = {
      Fix_Grammar = {
        prompt = "You are a tech blogger please help fix the grammar and enhance the readability of the following text: \n$buf",
        action = "display",
      },
      Grammar_Check = {
        prompt = "Validate that the grammar of the selected text is correct and makes sense: \n$sel",
        action = "display",
      },
      Translate = {
        prompt = "Translate the content to Spanish while keeping it consistent and readable: \n$buf",
        action = "display",
      },
    },
  },
}
