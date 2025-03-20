import sys
sys.path.append('../')

import functions.process as process
import functions.llm as llm
import functions.prompts as prompts

def anonymized_text(text, metadata, client, i, l, path):
    model = []
    current_text = process.sanitize_text(text)
    attempt = 0
    while((attempt == 0) or (attempt < 5 and len(model.to_remove) > 0)):
        res = llm.llm(client, current_text, prompts.anonymized(metadata), prompts.AnonymizedModel)
        model = prompts.AnonymizedModel.model_validate_json(res)
        # print(f"\n\nATTEMPT {attempt}")
        # print(f"input: {current_text}")
        current_text = process.remove_segments(current_text, model.to_remove)
        # print(model.to_remove)
        # print(f"remove: {current_text}")
        # print(f"output: {current_text}")
        attempt += 1
    print(f"- {path} | Anonymizing {i + 1}/{l + 1} [{attempt} Attempt(s)]")
    return current_text

def anonymized_texts(texts, metadata, client, path):
    return [ anonymized_text(text, metadata, client, i, len(texts), path) for i, text in enumerate(texts) ]