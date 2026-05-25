# Netflix Movies and TV Shows Data Analysis Using Python & PostgreSQL

![](https://github.com/ommoryani/Netflix_DataAnalysis_Python_PostgreSQL/blob/main/logo.png)


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
```

## Dataset

The data for this project is sourced from the Kaggle dataset:

- **Dataset Link:** [Movies Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

## Schema

```sql
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```


- **Content Distribution:** The dataset contains a diverse range of movies and TV shows with varying ratings and genres.
- **Common Ratings:** Insights into the most common ratings provide an understanding of the content's target audience.
- **Geographical Insights:** The top countries and the average content releases by India highlight regional content distribution.
- **Content Categorization:** Categorizing content based on specific keywords helps in understanding the nature of content available on Netflix.

This analysis provides a comprehensive view of Netflix's content and can help inform content strategy and decision-making.
## Results and Insights

This section highlights the core analytical findings derived from the combined Python preprocessing and PostgreSQL query pipelines:

- **Content Distribution & Library Composition**: The Netflix catalog is significantly skewed toward Movies rather than TV Shows. This data indicator outlines Netflix’s historical focus on standalone films, though TV show additions have shown different retention value trends in recent years.
- **Geographic Production Powerhouses**: Aggregating and splitting regional attributes isolated the United States and India as the leading production hotspots globally. These areas contribute the highest density of multi-genre distributions across both media types.
- **Audience Ratings & Classification Dynamics**: The most frequent age classification content tier on the platform is **TV-MA (Mature Audiences)**, closely followed by **TV-14**. By tracking text-based indicator groups (e.g., classifying dark themes, action, or violence vs family-friendly entries), the distribution patterns show a distinct curation methodology catering to mature adult demographics.
- **Content Expansion Triggers**: Temporal analysis reveals that content ingestion trends do not scale linearly throughout the year; strategic monthly spikes exist where high volumes of licensing and original content are pushed to maximize active subscriber usage during peak holidays and seasonal periods.

## Future Enhancements

To build on this foundation, the following high-priority extensions are planned for future iterations of this repository:

- **Interactive Visualization Dashboards**: Establish a connection pipeline between the local PostgreSQL instance and a business intelligence application (**Tableau** or **Power BI**) to build dynamic, interactive dashboards for global content tracking.
- **Sentiment & Content Recommendation Engine**: Expand the Python script segment to perform Natural Language Processing (NLP) and Sentiment Analysis on the textual `description` metadata to generate basic text-based content clustering and recommendation lists.
- **Automated ELT Pipeline Scheduling**: Move from a local manual Jupyter notebook execution pattern to an automated data workflow orchestrated by tools like **Apache Airflow**, allowing for real-time ingestion and cleaning schedules whenever a fresh media file dropped.

---

## License

This project is licensed under the MIT License. Feel free to use, modify, and distribute the scripts for educational and career portfolio purposes.


## 👨‍💻 Authors

Om Moryani

B.Tech -CSE (Internet of Things , Cybersecurity including Blockchain Technology)

REVA University, Bengaluru

## Acknowledgments

- **Data Source**: [Kaggle's Netflix Movies and TV Shows Dataset](https://www.kaggle.com/)
- **Inspiration**: Global streaming platform operations data modeling, competitive intelligence metrics, and advanced data engine normalization pipelines.
