# Can AI Solve the Peer Review Crisis? A Large-Scale Experiment on LLM's Performance and Biases in Evaluating Economics Papers

## Authors

- Pat Pataranutaporn (Massachusetts Institute of Technology, Cambridge, MA, USA)
- Nattavudh Powdthavee (Nanyang Technological University, Singapore, and IZA, University of Bonn, Germany)
- Chayapatr Archiwaranguprok (University of the Thai Chamber of Commerce)
- Pattie Maes (Massachusetts Institute of Technology, Cambridge, MA, USA)

## Abstract

We investigate whether artificial intelligence can address the peer review crisis in economics by analyzing 27,090 evaluations of 9,030 unique submissions using a large language model (LLM). The experiment systematically varies author characteristics (e.g., affiliation, reputation, gender) and publication quality (e.g., top-tier, mid-tier, low-tier, AI-generated papers). The results indicate that LLMs effectively distinguish paper quality but exhibit biases favoring prominent institutions, male authors, and renowned economists. Additionally, LLMs struggle to differentiate high-quality AI-generated papers from genuine top-tier submissions. While LLMs offer efficiency gains, their susceptibility to bias necessitates cautious integration and hybrid peer review models to balance equity and accuracy.
**Keywords**: Artificial intelligence; peer review; large language model (LLM); bias in academia; economics publishing; equity-efficiency trade-off

## Repository Structure

```
.
├── 1. extraction.ipynb                 # Paper extraction from PDF to TXT
├── 1. extraction-cleanup.ipynb         # Post-extraction cleanup
|
├── 2. generate-anthropic.ipynb         # Fake paper generation
├── 2. generate-deepinfra.ipynb
├── 2. generate-openai.ipynb
├── 2. df-fake-papers.ipynb
|
├── 3. evaluation-anthropic.ipynb       # Main paper evaluation using LLMs
├── 3. evaluation-deepinfra.ipynb
├── 3. evaluation-openai.ipynb
├── 3. merge.ipynb
|
├── 4. bias-anthropic.ipynb             # LLM bias evaluation
├── 4. bias-deepinfra.ipynb
├── 4. bias-openai.ipynb
├── 4. reshape.ipynb                    # Result postprocess
|
├── 5. biology-gemma.ipynb              # Sanity check (evaluate as molecular biology paper)
├── 5. biology.ipynb
├── 5. partial-gemma.ipynb              # Sanity check #2 (partial evaluation: 0.1%, 1%, 10%, 50%, 100%)
├── 5. partial.ipynb
|
├── 5. token count.ipynb                # Token counting
|
├── README.md
|
├── functions
│   ├── anonymize.py                    # (Paper Extraction) Paper anonymization functions
│   ├── dupes.py                        # (Paper Extraction) Duplication checking functions
│   ├── llm.py                          # (Paper Extraction) LLM functions wrappers
│   ├── process.py                      # (Paper Extraction) Process functions wrappers
│   └── prompts.py                      # LLM Prompts
|
├── results
│   ├── main.csv                        # Main evaluation (110 journals * 10 papers/journal = 1100 papers)
│   ├── fake.csv                        # Main evalation of fake papers (120 papers)
│   ├── bias.csv                        # LLM bias evaluation (110 journals * 3 papers/journal = 330 papers)
│   ├── bio.csv                         # Sanity check #1 (evaluate as molecular biology paper)
│   └── partial.csv                     # Sanity check #2 (partial evaluation: 0.1%, 1%, 10%, 50%, 100%)
|
└── requirements.txt

```

## Data Processing Pipeline

1. **Dataset Construction**

   - Extracting research papers from PDF format to machine-readable TXT files (`1. extraction.ipynb`)
   - Cleaning + Formatting data (`1. extraction-cleanup.ipynb`)

2. **Dataset Construction (Fake Papers)**:

   - Creating fake research papers using LLMs
     - OpenAI -> o1 / GPT-4o (`2. generate-openai.ipynb`)
     - Anthropic -> Claude 3.7 Sonnet with Extended Thinking (`2. generate-anthropic.ipynb`)
     - Deep Infra (Platform) -> Gemma 3 27B / LLaMA 3.1 405B / DeekSeek-R1 (`2. generate-deepinfra.ipynb`)
   - Additional data transformations (`2. df-fake-papers.ipynb`)

3. **Main Evaluation**:

   - Evaluate research papers using 4 LLMs
     - OpenAI -> GPT-4o mini (`3. evaluation-openai.ipynb`)
     - Anthropic -> Claude 3.5 Haiku (`3. evaluation-anthropic.ipynb`)
     - Deep Infra (Platform) -> Gemma 3 27B / LLaMA 3.3 70B (`3. evaluation-deepinfra.ipynb`)
   - Additional data transformations (`3. merge.ipynb`)

4. **LLM Bias Evaluation**:

   - Evaluate research papers using 4 LLMs (for bias checking)
     - OpenAI -> GPT-4o mini (`3. evaluation-openai.ipynb`)
     - Anthropic -> Claude 3.5 Haiku (`3. evaluation-anthropic.ipynb`)
     - Deep Infra (Platform) -> Gemma 3 27B / LLaMA 3.3 70B (`3. evaluation-deepinfra.ipynb`)
   - Additional data transformations (`3. reshape.ipynb`)

5. **Sanity Check + Misc.**:

   - Sanity check #1: evaluate as molecular biology paper (`5. biology.ipynb`)
   - Sanity check #2: partial evaluation: 0.1%, 1%, 10%, 50%, 100% (`5. partial.ipynb`)
   - Counting token usage (`5. token count.ipynb`)

## Usage

To reproduce the analysis:

1. Clone this repository
2. Install required dependencies (list of requirements to be added)
3. Save research papers to the folder `Journals`
4. Run notebooks in numerical order (1-5)

   - For 3. and 4., each of the notebook generates a csv file containing the evaluation
     - For 3. use `3. merge.ipynb` to merge 4 csvs together
     - For 4. use `3. merge.ipynb` to merge 4 csvs together, then use `4. reshape` to reshape the format
     - For evaluation using `deepinfra` (3., 4., and 5.), modify the variables `model` and `model_name` to change the model being used

## Requirements

```
anthropic==0.49.0
dotenv==0.9.9
numpy==2.2.2
openai==1.61.1
pandas==2.2.3
pydantic==2.10.6
pydantic_core==2.27.2
PyMuPDF==1.25.3
```

## Citation

If you use this code or data in your research, please cite:

```
@article{pataranutaporn2025ai,
  title={Can AI Solve the Peer Review Crisis? A Large-Scale Experiment on LLM's Performance and Biases in Evaluating Economics Papers},
  author={Pataranutaporn, Pat and Powdthavee, Nattavudh and Archiwaranguprok, Chayapatr and Maes, Pattie},
  year={2025},
  publisher={forthcoming}
}
```

## Contact

For questions about the code or data, please contact:
patpat[at]mit.edu
nick.powdthavee[at]ntu.edu.s
pub[at]from.pub
