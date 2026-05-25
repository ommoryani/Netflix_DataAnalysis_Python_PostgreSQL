# Netflix Movies and TV Shows Data Analysis Using Python & PostgreSQL



![](https://img.shields.io/badge/Python-3.x-blue?style=for-the-badge&logo=python)
![](https://img.shields.io/badge/PostgreSQL-15+-blue?style=for-the-badge&logo=postgresql)
![](https://img.shields.io/badge/Pandas-Data_Cleaning-orange?style=for-the-badge&logo=pandas)

## Project Overview
This project demonstrates a comprehensive end-to-end data engineering and analytics pipeline using **Python (Pandas, NumPy)** and **PostgreSQL**. The dataset consists of comprehensive information regarding movies and TV shows available on Netflix, including details like directors, cast, country of origin, release year, ratings, and descriptions. 

The primary goal of this project is to showcase advanced data cleaning techniques inside a Jupyter Notebook environment (implementing robust error handling via `try-except` blocks), establish a seamless Python-to-SQL pipeline, and solve critical business questions using complex SQL analytics.

## Project Objectives
- **Environment Setup:** Configure an isolated development environment utilizing Mac virtual environments (`venv`) integrated with Visual Studio Code.
- **Robust Data Cleaning:** Programmatically handle structural anomalies, null records, missing descriptive metrics, and duplicate rows utilizing Python.
- **Database Engineering:** Dynamically establish a connection to a local PostgreSQL instance using SQLAlchemy and programmatically seed production-ready data tables.
- **Advanced Business Analytics:** Write and optimize SQL queries to derive deep contextual insights from the cleaned Netflix repository.

## Technical Architecture & Pipeline

```text
┌─────────────────┐       ┌────────────────────────┐       ┌──────────────────────┐
│  Raw CSV Data   │ ───>  │  Python Data Cleaning  │ ───>  │  SQLAlchemy Engine  │
│  (Kaggle Drop)  │       │ (Pandas & Try-Except)  │       │ (PostgreSQL Pipeline)│
└─────────────────┘       └────────────────────────┘       └──────────────────────┘
                                                                       │
                                                                       ▼
┌─────────────────┐       ┌────────────────────────┐       ┌──────────────────────┐
│ Final Insights  │ <───  │   Business Questions   │ <───  │ PostgreSQL Database  │
│  & Portfolio    │       │                        │       │   (Cleaned Table)    │
└─────────────────┘       └────────────────────────┘       └──────────────────────┘
