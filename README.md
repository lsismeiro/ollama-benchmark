# ollama-benchmark

This bash script benchmarks ollama on any system where it is installed.

For a quick installation, try:

```
curl -fsSL https://ollama.com/install.sh | sh
```

> If you're not running Linux, [download Ollama](https://ollama.com/download/mac) from the official site.

Verify you can run `ollama` with a given model:

```
ollama run llama3.2:3b
```

Then run this benchmark script:

```
./obench.sh
```

Uninstall Ollama following the [official uninstall instructions](https://github.com/ollama/ollama/blob/main/docs/linux.md#uninstall).

## Limitations

Currently the script just outputs the data from three runs. There are some TODO's in the script for things I'd like to make nicer someday, for now I just want a quick way to run the same tests on different machines :)

I may also set something up where I could run the tests against [Open WebUI](https://docs.openwebui.com) so it could also do an end-to-end test of how well a host would perform hosting a chatbot UI for multiple users. Probably not. But maybe.

## Findings

| System | CPU/GPU | Model | Eval Rate |
| :--- | :--- | :--- | :--- |
| Raspberry Pi 5 - 8GB | CPU | llama3.2:3b | 4.35 Tokens/s |
| Raspberry Pi 5 - 8GB | CPU | llama3.1:8b | 1.86 Tokens/s |
| M1 Max Mac Studio (10 core - 64GB) | GPU | llama3.2:3b | 59.38 Tokens/s |
| M1 Max Mac Studio (10 core - 64GB) | GPU | llama3.1:8b | 45.32 Tokens/s |
| M1 Max Mac Studio (10 core - 64GB) | GPU | llama3.1:70b | 7.25 Tokens/s |
| M4 Mac mini (10 core - 32GB) | GPU | llama3.2:3b | 38.23 Tokens/s |
| M4 Mac mini (10 core - 32GB) | GPU | llama3.1:8b | 19.27 Tokens/s |
| Ryzen 9 7900X (Nvidia 4090) | GPU | llama3.2:3b | 237.05 Tokens/s |
| Ryzen 9 7900X (Nvidia 4090) | GPU | llama3.1:8b | 148.09 Tokens/s |
| Ryzen 9 7900X (Nvidia 4090) | GPU/CPU | llama3.1:70b | 3.10 Tokens/s |
| AmpereOne A192-32X (192 core - 512GB) | CPU | llama3.2:3b | 23.52 Tokens/s |
| AmpereOne A192-32X (192 core - 512GB) | CPU | llama3.1:8b | 17.47 Tokens/s |
| AmpereOne A192-32X (192 core - 512GB) | CPU | llama3.1:70b | 3.86 Tokens/s |
| AmpereOne A192-32X (192 core - 512GB) | CPU | llama3.1:405b | 0.90 Tokens/s |

## Further Reading

This script is just a quick way of comparing _one aspect_ of generative AI performance. There are _many other_ aspects that are as important (or more important) this script does _not_ cover.

See [All about Timing: A quick look at metrics for LLM serving](https://isaac-chung.github.io/blog/llm-serving) for a good overview of other metrics you may want to compare when running Ollama.

## Author

This benchmark is based on the upstream project [tabletuser-blogspot/ollama-benchmark](https://github.com/tabletuser-blogspot/ollama-benchmark), and is maintained by Jeff Geerling.
