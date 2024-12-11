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

| System | CPU/GPU | Model | Eval Rate | Power (Peak) |
| :--- | :--- | :--- | :--- | :--- |
| Pi 400 - 4GB | CPU | llama3.2:3b | 1.60 Tokens/s | 6 W |
| Pi 5 - 8GB | CPU | llama3.2:3b | 4.61 Tokens/s | 13.9 W |
| Pi 5 - 8GB | CPU | llama3.1:8b | 1.99 Tokens/s | 13.2 W |
| Pi 5 - 8GB | CPU | llama2:13b | DNF | DNF |
| Pi 5 - 8GB / AMD RX 6500 XT 8GB | GPU | llama3.2:3b | 39.82 Tokens/s | 88 W |
| Pi 5 - 8GB / AMD RX 6500 XT 8GB | GPU | llama3.1:8b | 22.42 Tokens/s | 95.7 W |
| Pi 5 - 8GB / AMD RX 6500 XT 8GB | GPU | llama2:13b | 2.03 Tokens/s | 48.3 W |
| Pi 5 - 8GB / AMD RX 6700 XT 12GB | GPU | llama3.2:3b | 49.01 Tokens/s | 94 W |
| Pi 5 - 8GB / AMD RX 6700 XT 12GB | GPU | llama3.1:8b | 39.70 Tokens/s | 135 W |
| Pi 5 - 8GB / AMD RX 6700 XT 12GB | GPU | llama2:13b | 3.98 Tokens/s | 95 W |
| Pi 5 - 8GB / AMD RX 7600 8GB | GPU | llama3.2:3b | 48.47 Tokens/s | 156 W |
| Pi 5 - 8GB / AMD RX 7600 8GB | GPU | llama3.1:8b | 32.60 Tokens/s | 174 W |
| Pi 5 - 8GB / AMD RX 7600 8GB | GPU | llama2:13b | 2.42 Tokens/s | 106 W |
| Pi 5 - 8GB / AMD Radeon Pro W7700 16GB | GPU | llama3.2:3b | 56.14 Tokens/s | 145 W |
| Pi 5 - 8GB / AMD Radeon Pro W7700 16GB | GPU | llama3.1:8b | 39.87 Tokens/s | 52 W |
| Pi 5 - 8GB / AMD Radeon Pro W7700 16GB | GPU | llama2:13b | 4.38 Tokens/s | 108 W |
| M4 Mac mini 10 core / 32GB | GPU | llama3.2:3b | 41.31 Tokens/s | 30.1 W |
| M4 Mac mini 10 core / 32GB | GPU | llama3.1:8b | 20.95 Tokens/s | 29.4 W |
| M4 Mac mini 10 core / 32GB | GPU | llama2:13b | 13.60 Tokens/s | 29.8 W |
| M1 Max Mac Studio (10 core - 64GB) | GPU | llama3.2:3b | 59.38 Tokens/s | N/A |
| M1 Max Mac Studio (10 core - 64GB) | GPU | llama3.1:8b | 45.32 Tokens/s | N/A |
| M1 Max Mac Studio (10 core - 64GB) | GPU | llama2:13b | 32.85 Tokens/s | N/A |
| M1 Max Mac Studio (10 core - 64GB) | GPU | llama3.1:70b | 7.25 Tokens/s | N/A |
| Ryzen 9 7900X (Nvidia 4090) | GPU | llama3.2:3b | 237.05 Tokens/s | N/A |
| Ryzen 9 7900X (Nvidia 4090) | GPU | llama3.1:8b | 148.09 Tokens/s | N/A |
| Ryzen 9 7900X (Nvidia 4090) | GPU/CPU | llama3.1:70b | 3.10 Tokens/s | N/A |
| System76 Thelio Astra (Nvidia A400) | GPU | llama3.2:3b | 35.51 Tokens/s | 167 W |
| System76 Thelio Astra (Nvidia A400) | CPU/GPU | llama3.1:8b | 2.79 Tokens/s | 190 W |
| System76 Thelio Astra (Nvidia A400) | CPU/GPU | llama2:13b | 7.93 Tokens/s | 223 W |
| System76 Thelio Astra (Nvidia A4000) | GPU | llama3.2:3b | 90.92 Tokens/s | 244 W |
| System76 Thelio Astra (Nvidia A4000) | GPU | llama3.1:8b | 59.11 Tokens/s | 250 W |
| System76 Thelio Astra (Nvidia A4000) | GPU | llama2:13b | 44.00 Tokens/s | 254 W |
| System76 Thelio Astra (AMD Pro W7700<sup>1</sup>) | GPU | llama3.2:3b | 89.31 Tokens/s | 261 W |
| System76 Thelio Astra (AMD Pro W7700<sup>1</sup>) | GPU | llama3.1:8b | 56.92 Tokens/s | 278 W |
| System76 Thelio Astra (AMD Pro W7700<sup>1</sup>) | CPU/GPU | llama2:13b | 8.41 Tokens/s | 187 W |
| AmpereOne A192-32X (192 core - 512GB) | CPU | llama3.2:3b | 23.52 Tokens/s | N/A |
| AmpereOne A192-32X (192 core - 512GB) | CPU | llama3.1:8b | 17.47 Tokens/s | N/A |
| AmpereOne A192-32X (192 core - 512GB) | CPU | llama3.1:70b | 3.86 Tokens/s | N/A |
| AmpereOne A192-32X (192 core - 512GB) | CPU | llama3.1:405b | 0.90 Tokens/s | N/A |

<sup>1</sup> These GPUs were tested using `llama.cpp` with Vulkan support.

## Further Reading

This script is just a quick way of comparing _one aspect_ of generative AI performance. There are _many other_ aspects that are as important (or more important) this script does _not_ cover.

See [All about Timing: A quick look at metrics for LLM serving](https://isaac-chung.github.io/blog/llm-serving) for a good overview of other metrics you may want to compare when running Ollama.

## Author

This benchmark is based on the upstream project [tabletuser-blogspot/ollama-benchmark](https://github.com/tabletuser-blogspot/ollama-benchmark), and is maintained by Jeff Geerling.
