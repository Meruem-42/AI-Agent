import ollama

stream = ollama.chat(
    model='llama3',
    messages=[{'role': 'user', 'content': 'Explain quantum physics in one sentence.'}],
    stream=True,
)

for chunk in stream:
  print(chunk['message']['content'], end='', flush=True)
print() # New line at the end