from pydantic import BaseModel

"|-------------------------[Paper Anonymization]-------------------------|"

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

1. Non-anonymized (Is the author's name or affiliations directly related to the author's institution but not mentioned in a third-party manner)
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
1. Be precise - extract only the exact text to remove, not the surrounding content.
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

"|-------------------------[Paper Evaluation]-------------------------|"

def top5():
   return """In your capacity as a reviewer for one of the most prestigious and highly selective top-5 economics journals (such as Econometrica, Journal of Political Economy, or The Quarterly Journal of Economics), please determine whether you would recommend this submission for publication using the following 7-point scale: 1 = Definite Reject: Fatal flaws in theory/methodology, insufficient contribution, or serious validity concerns that make the paper unsuitable for the journal, 2 = Reject with Option to Resubmit: Significant issues with theory, methodology, or contribution, but potentially salvageable with major revisions and fresh review, 3 = Major Revision: Substantial changes needed to theory, empirics, or exposition, but the core contribution is promising enough to warrant another round, 4 = Minor Revision: Generally strong paper with few small changes needed in exposition, robustness checks, or literature discussion, 5 = Very Minor Revision: Excellent contribution needing only technical corrections or minor clarifications, 6 = Accept As Is: Exceptional contribution ready for immediate publication"""

def analysis():
    return """Please evaluate the attached research according to the following criteria.

ORIGINALITY
"In your capacity as an editorial board/reviewer for this paper, please rate this paper’s originality. Note that papers with high originality typically address questions of broad, foundational importance or propose groundbreaking methodologies. They often set new standards in the field or open new research avenues. 
 (0 = Completely unoriginal, …, 10 = Completely original)”

RIGOR
"In your capacity as an editorial board/reviewer for this paper, please rate this paper’s rigor. Note that papers that are rigorous are those in which the data handling and analysis process is highly transparent, with all steps carefully documented (0 = Not at all rigorous, …, 10 = Extremely rigorous)”

SCOPE
"In your capacity as an editorial board/reviewer for this paper, please rate this paper’s scope. Note that papers that have a narrow scope are those that focus on narrower questions or less generalisable findings, which, while still valuable, may not have the same broad impact (0 = Very narrow scope, …, 10 = Very wide scope)”

IMPACT
"In your capacity as an editorial board/reviewer for this paper, please rate this paper’s impact. Note that papers with high impact have clear implications for public policy or major economic debates, making their findings influential beyond academia. (0 = Minimal impact, …, 10 = Maximum impact)”

WRITTEN_BY_AI
"Please determine whether this paper was written by AI (0 = Definitely human-written, …, 10 = Definitely AI-generated)”
"""

class Top5Model(BaseModel):
    score: int
    
class AnalysisModel(BaseModel):
    originality: int
    rigor: int
    scope: int
    impact: int
    written_by_ai: int