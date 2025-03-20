import sys
sys.path.append('../')

import functions.prompts as prompts
import functions.llm as llm

def get_duplicates(texts, occur=3, min_len=10):
    dupes = {}
    for i in range(len(texts)):
        x = [p.strip() for p in texts[i].split("\n") if len(p) > min_len]
        for m in x:
            if m not in dupes:
                dupes[m] = 1
            else:
                dupes[m] += 1
            
    return { k: v for k, v in sorted(dupes.items(), key=lambda item: item[1], reverse=True) if v > occur }

def check_flag_from_dupes(dupes, metadata, client):
    return prompts \
        .FlagModel \
        .model_validate_json(
            llm.llm(client, str([dupe for dupe in dupes]), prompts.flag(metadata), prompts.FlagModel)
        )
        
def merge_dupes(dupes, flag_dupes):
    dupes_format = [dupe for dupe in dupes]
    dupes_flag_format = [dupe for dupe in flag_dupes.dupes]
    flagged = []
    
    for i in range(len(dupes)):
        if(dupes_format[i] == dupes_flag_format[i].text and dupes_flag_format[i].flag):
            flagged.append(dupes_format[i])
            
    return flagged

def get_flagged_duplicates(texts, metadata, client, occur=3, min_len=10):
    dupes = get_duplicates(texts, occur, min_len)
    flag_dupes = check_flag_from_dupes(dupes, metadata, client)
    # print(len(dupes), len(flag_dupes.dupes))
    return merge_dupes(dupes, flag_dupes)

# is not really dangerous, to be fair ¯\_(ツ)_/¯
def get_flagged_duplicates_danger(texts, metadata, client, occur=3, min_len=10):
    dupes = get_duplicates(texts, occur, min_len)
    flag_dupes = check_flag_from_dupes(dupes, metadata, client)
    return [ dupe.text for dupe in flag_dupes.dupes if dupe.flag ]