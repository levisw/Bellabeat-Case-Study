# Bellabeat Case Study: How Can a Wellness Technology Company Play It Smart?

**A data analytics case study exploring smart device usage trends to inform Bellabeat's marketing strategy.**

---

## Project Overview

Bellabeat is a high-tech manufacturer of health-focused smart products for women. The company has grown in the wellness tech space with products including the Leaf tracker, Time watch, Spring water bottle, and the Bellabeat app.

Bellabeat's cofounder believes that analyzing smart device fitness data from consumers could reveal untapped opportunities for growth. This project follows the full data analysis process to turn that idea into actionable marketing recommendations.

---

## Business Task

Analyze smart device usage data from a public FitBit dataset to uncover trends in how consumers use non-Bellabeat wearable devices. Apply those trends to Bellabeat's customer base and use the insights to generate high-level marketing recommendations for the Time watch.

---

## Case Study Process & Deliverables

This project follows Google's Data Analytics case study framework. Each phase below has its own write-up in `report/`.

| Phase | Deliverable |
|---|---|
| 1. [Ask](report/01-ask.md) | Summary of the business task |
| 2. [Prepare](report/02-prepare.md) | Description of data sources |
| 3. [Process](report/03-process.md) | Documentation of data cleaning |
| 4. [Analyze](report/04-analyze.md) | Summary of the analysis |
| 5. [Share](report/05-share.md) | Visualizations and key findings |
| 6. [Act](report/06-act.md) | Recommendations |

See [`DECISIONS.md`](DECISIONS.md) for a running log of key judgment calls made throughout the project.

---

## Repo Structure

```
├── README.md
├── DECISIONS.md            <- Log of key judgment calls made throughout the project
├── data/
│   ├── raw/                <- Original, unmodified dataset files
│   └── cleaned/            <- Cleaned/processed data 
├── analysis/               <- Scripts / notebooks for cleaning & analysis
├── visuals/                <- Exported charts and graphics
└── report/                 <- Phase-by-phase write-ups
```

---

## Tools

**R**, using the `tidyverse`, `lubridate`, and `janitor` packages.

---

## Data Source

[FitBit Fitness Tracker Data](https://www.kaggle.com/datasets/arashnic/fitbit) (CC0: Public Domain, made available via Mobius) — personal fitness tracker data from 33 FitBit users. This analysis uses daily activity, hourly steps, hourly intensity, sleep, and weight log data; minute-level files and heart rate data were excluded (see `DECISIONS.md`).

---