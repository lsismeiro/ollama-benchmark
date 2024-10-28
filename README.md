# ollama-benchmark

This bash script benchmarks ollama on any system where it is installed.

For a quick installation, try:

```
curl -fsSL https://ollama.com/install.sh | sh
```

Verify you can run `ollama` with a given model:

```
export ollama_model="llama3.2:3b"
ollama run $ollama_model
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

| System | Model | Eval Rate |
| --- | --- | --- |
| Raspberry Pi 5 - 8GB | llama3.2:3b | 4.35 Tokens/s |
| Raspberry Pi 5 - 8GB | llama3.1:8b | 1.86 Tokens/s |

## Further Reading

This script is just a quick way of comparing _one aspect_ of generative AI performance. There are _many other_ aspects that are as important (or more important) this script does _not_ cover.

See [All about Timing: A quick look at metrics for LLM serving](https://isaac-chung.github.io/blog/llm-serving) for a good overview of other metrics you may want to compare when running Ollama.

## Author

This benchmark is based on the upstream project [tabletuser-blogspot/ollama-benchmark](https://github.com/tabletuser-blogspot/ollama-benchmark), and is maintained by Jeff Geerling.
