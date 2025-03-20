import sys
import re
import pymupdf
sys.path.append('../')

import functions.llm as llm
import functions.prompts as prompts

def get_paper_metadata(client, text):
    return llm.llm(client, text, prompts.metadata(), prompts.MetadataModel)

def extract_texts_from_pdf(file_path):
    with open(file_path, "r") as file:
        pdf = pymupdf.open(file)
        texts = []
        for page in pdf:
            texts.append(page.get_text("text"))
        return texts
        
def remove_segments(text, segments):
    for segment in segments:
        text = text.replace(segment, "")
    return text.strip()

def remove_segments_from_texts(texts, segments):
    return [ remove_segments(text, segments) for text in texts]

def sanitize_text(text):
    return re.sub(r"\s+", " ", text).replace("\n", " ").strip()

def remove_page_numbers(pages):
    page_num_pattern = re.compile(r'^(\d+)\s+')
    numbered_pages = [(i, int(page_num_pattern.match(page).group(1))) 
                      for i, page in enumerate(pages) 
                      if page_num_pattern.match(page)]
    
    if len(numbered_pages) < 2:
        return pages
    
    groups = {}
    
    for interval in range(1, min(5, len(numbered_pages))):
        for start in range(interval):
            pattern_pages = [(pos, num) for pos, num in numbered_pages 
                            if (pos - start) % interval == 0]
            
            # Only consider patterns with enough matching pages
            if len(pattern_pages) >= 2:
                # Check if the page numbers form a consistent sequence
                # Calculate differences between consecutive page numbers
                diffs = [(pattern_pages[i][1] - pattern_pages[i-1][1]) / 
                         (pattern_pages[i][0] - pattern_pages[i-1][0])
                         for i in range(1, len(pattern_pages))]
                
                # If all differences are the same, we have a valid pattern
                if diffs and all(d == diffs[0] for d in diffs):
                    key = (start, interval, diffs[0])
                    groups[key] = pattern_pages
    
    # If we found any valid patterns
    if groups:
        # Find the pattern that covers the most pages
        best_pattern = max(groups.items(), key=lambda x: len(x[1]))
        pattern_pages = best_pattern[1]
        
        # Remove page numbers from pages that match the pattern
        result = pages.copy()
        for pos, _ in pattern_pages:
            match = page_num_pattern.match(pages[pos])
            if match:
                result[pos] = pages[pos][match.end():]
        
        return result
    
    # No consistent pattern found
    return pages