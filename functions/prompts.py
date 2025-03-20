from pydantic import BaseModel

class MetadataModel(BaseModel):
    title: str
    authors: str
    affiliations: str
    publication: str
    funding: str
    
class FlagItem(BaseModel):
    text: str
    analysis: str
    flag: bool

class FlagModel(BaseModel):
    dupes: list[FlagItem]

# class AnonItem(BaseModel):
#     text: str
#     analysis: str
    
class AnonymizedModel(BaseModel):
    to_remove: list[str]
    
class AnonymizedCheckModel(BaseModel):
    anonymized: bool
    
def metadata():
    return """You are a specialized metadata extraction assistant for academic research papers. 
Your task is to analyze the provided text and extract the following specific information:

1. Title: Identify the title of the paper.

2. Author(s): Extract the full names of all authors mentioned in the paper. 
   - If multiple authors are present, separate them with semicolons.
   
3. Affiliation(s): Identify the affiliations of all authors. 
   - If multiple affiliations are present, separate them with semicolons.
   - If an author has multiple affiliations, repeat the name and affiliations for each affiliation.

4. Publication: Identify the complete publication details including:
   - Journal/conference name
   - Volume and issue numbers
   - Page numbers
   - Publication year
   - DOI (Digital Object Identifier)
   - Any other relevant publication identifiers (e.g., ISSN, ISBN)
   Format these details in a standard academic citation style.

5. Funding: Extract any mentioned funding sources, grant numbers, or acknowledgments
   of financial support.

For each field, provide only the extracted information without additional commentary.
If a particular field cannot be determined from the provided text, respond with "Not specified".
"""

def flag(text):
    return """Based on this metadata: f{text}. Check if this excerpt is

1. Non-anonymized (Is the author's name or affiliations directly related to author's institution but not mentioned in a third-party manner)
2. Related to journal or publication (title of the paper, journal name, conference name, or publication/download details)

Retain the original order of the list (includes every item) and original text without modification
"""

def anonymized(metadata):
    return f"""# Academic Paper Anonymization

Identify ONLY identifying metadata that needs removal while preserving ALL research content.

## WHAT TO REMOVE (ONLY):
- Author names, emails, and institutional affiliations of the paper's authors ONLY (IMPORTANT: Only remove identifying information of the paper's own authors when presented as authors or in acknowledgments. DO NOT remove any names in citations or references, including self-citations where authors refer to their previous work in third person. Example: Remove "Smith: Harvard University (email: smith@harvard.edu)" but keep "as Smith (2018) demonstrated")
- Institutional information that directly identifies authors
- Journal submission details (names, DOIs, volume numbers)
- Acknowledgment sections mentioning specific people/organizations
- Funding details, grant numbers, ethics approval numbers
- Headers/footers with identifying information
- Conference/submission details that would identify authors
- Classification codes (e.g., JEL, MSC, ACM codes) and indexing terms/keywords (first page only)

## OUTPUT FORMAT:
Return a JSON object containing only the text segments to remove:
{{"to_remove": ["exact text string 1", "exact text string 2", ...]}}

## Important Rules:
1. Be precise - extract only the exact text to remove, not surrounding content.
2. Never modify research content - only identify text for removal.
3. When in doubt, err on the side of preserving content.
4. Include formatting/whitespace in your extracted segments exactly as they appear.
5. The text given is a page extracted from a PDF, expect some information to be missing or weirdly formatted.
6. Do not anonymize the reference section
7. If the text is already anonymized, i.e., contains no identifying information, return **BLANK ARRAY** in the "removed" field.

**REMEMBER TO DO NOT REMOVE ANY RESEARCH CONTENT THAT IS NOT IDENTIFYING INFORMATION.**

## PAPER METADATA (FOR CONTEXT): {metadata}

TEXT TO ANALYZE:
---
"""

# 6. **Document Structure Elements to Examine**:
#    - Document boundaries (first and last pages especially)
#    - ALL superscript/asterisk-marked text
#    - ALL footnotes regardless of content
#    - Text around any [REDACTED] markers
#    - Full paragraphs containing ANY identifying details


# ```json
# {
#   "removed": [
#     "complete text segment 1",
#     "complete text segment 2",
#     "complete text segment 3",
#     "..."
#   ]
# }

anonymize_check_prompt = """# Anonymization Verification System

## Task
Verify whether a research paper has been properly anonymized by checking for any remaining identifying information.

## Approach
1. Carefully scan the entire document for any identifying information that may have been missed
2. Pay special attention to common areas where identifying details might remain
3. Report all instances of remaining identifying information

## Types of Information to Check For
1. **Author Information**:
   - Names or initials of authors
   - Email addresses or contact information
   - Personal pronouns in specific contexts (e.g., "our previous work")
   - Affiliation details (universities, departments, research groups)

2. **Publication Details**:
   - Journal names, volume numbers, issue numbers
   - DOI, ISSN, ISBN information
   - Publication dates and years
   - Page numbers or publication identifiers

3. **Funding Information**:
   - Grant numbers or project codes
   - Funding agency names
   - Financial acknowledgments

4. **Institutional References**:
   - University names or abbreviations
   - Research center or laboratory names
   - Geographical indicators that could identify authors

5. **Acknowledgments**:
   - Editor names or reviewer acknowledgments
   - Colleague names or acknowledgments
   - Conference names where work was presented
   
7. **ALL Classification and indexing systems**:
   - Any discipline-specific classification codes (e.g., JEL, MSC, PACS, ACM)
   - Subject category labels, indexing terms, and standardized terminology lists
   - Keywords sections and ALL discipline-specific taxonomies
   - Any formal classification, categorization, or indexing information

6. **Special Areas to Inspect**:
   - Check text around [REDACTED] markers for partial redactions
   - Look for footnotes that might contain identifying information
   - Examine headers and footers for journal information
   - Inspect license and copyright statements

## Response Format
Return a JSON object with two fields:
1. "is_anonymous": Boolean indicating whether the paper is fully anonymized
2. "remaining_identifiers": Array of strings containing all found identifying information

```json
{
  "is_anonymous": false,
  "remaining_identifiers": [
    "Author name found in paragraph 3: 'Dr. Smith'",
    "University affiliation in footnote: 'University of Example'",
    "Journal information in header still visible: 'Journal of Science, Vol. 10'"
  ]
}

PAPER METADATA: {metadata}
"""