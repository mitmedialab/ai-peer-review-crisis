# Can AI Solve the Peer Review Crisis? A Large-Scale Experiment on LLM's Performance and Biases in Evaluating Economics Papers

## Authors

- Pat Pataranutaporn (Massachusetts Institute of Technology, Cambridge, MA, USA)
- Nattavudh Powdthavee (Nanyang Technological University, Singapore, and IZA, University of Bonn, Germany)
- Pattie Maes (Massachusetts Institute of Technology, Cambridge, MA, USA)

## Abstract

We investigate whether artificial intelligence can address the peer review crisis in economics by analyzing 27,090 evaluations of 9,030 unique submissions using a large language model (LLM). The experiment systematically varies author characteristics (e.g., affiliation, reputation, gender) and publication quality (e.g., top-tier, mid-tier, low-tier,  AI-generated papers). The results indicate that LLMs effectively distinguish paper quality but exhibit biases favoring prominent institutions, male authors, and renowned economists. Additionally, LLMs struggle to differentiate high-quality AI-generated papers from genuine top-tier submissions. While LLMs offer efficiency gains, their susceptibility to bias necessitates cautious integration and hybrid peer review models to balance equity and accuracy.
**Keywords**: Artificial intelligence; peer review; large language model (LLM); bias in academia; economics publishing; equity-efficiency trade-off


## Repository Structure

```
.
├── code/
│   ├── 01_dataset_construction.ipynb   # Initial dataset preparation
│   ├── 02_eval.ipynb                   # Evaluation metrics and analysis
│   ├── 03_Post_processing.ipynb        # Post-processing of results
│   ├── 04_Rerun_missing_data.ipynb     # Handling missing data
│   ├── 05_combine_df.ipynb             # Combining dataframes
│   ├── 06_add_meta_data.ipynb          # Adding metadata
│   └── 07_plot.ipynb                   # Visualization generation
├── final/                              # Final processed outputs
├── input/                              # Raw input data
├── process/                            # Intermediate processing files
├── results/
│   └── final_combined_data.csv         # Combined analysis results
└── statistical analysis/
    ├── Journal discrimination project 180125.do  # Stata analysis
    └── journal_discrim.dta                       # Stata dataset
```

## Data Processing Pipeline

1. **Dataset Construction** (01_dataset_construction.ipynb):
   - Initial data preparation and cleaning
   - Creation of base dataset structure

2. **Evaluation** (02_eval.ipynb):
   - Implementation of evaluation metrics
   - Analysis of LLM performance

3. **Post-Processing** (03_Post_processing.ipynb):
   - Cleaning and formatting of results
   - Additional data transformations

4. **Missing Data Handling** (04_Rerun_missing_data.ipynb):
   - Identification and processing of missing data points
   - Rerunning necessary evaluations

5. **Data Combination** (05_combine_df.ipynb):
   - Merging multiple dataframes
   - Ensuring data consistency

6. **Metadata Addition** (06_add_meta_data.ipynb):
   - Adding relevant metadata to the dataset

7. **Visualization** (07_plot.ipynb):
   - Generation of figures and plots

## Statistical Analysis

The statistical analysis folder contains Stata files for advanced statistical analysis:
- `Journal discrimination project 180125.do`: Main analysis script
- `journal_discrim.dta`: Processed data for statistical analysis

## Usage

To reproduce the analysis:

1. Clone this repository
2. Install required dependencies (list of requirements to be added)
3. Run notebooks in numerical order (01 through 07)
4. Execute Stata do-file for statistical analysis

## Requirements

(To be added: list of required Python packages and versions, Stata version)

## Citation

If you use this code or data in your research, please cite:

```
@article{pataranutaporn2025ai,
  title={Can AI Solve the Peer Review Crisis? A Large-Scale Experiment on LLM's Performance and Biases in Evaluating Economics Papers},
  author={Pataranutaporn, Pat and Powdthavee, Nattavudh and Maes, Pattie},
  year={2025},
  publisher={forthcoming}
}
```


## Contact

For questions about the code or data, please contact:
patpat[at]mit.edu
nick.powdthavee[at]ntu.edu.s
