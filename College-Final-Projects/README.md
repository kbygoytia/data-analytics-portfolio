# College Data & Research Projects

Coursework and research from my B.A. in Computer Science and Statistical &
Data Sciences at Smith College — statistical modeling, machine learning,
data visualization, HCI/UX research, and computational math. Most analysis
was done in R. All files referenced below live in this folder; several were
team projects (collaborators credited inside each paper).
---

## In-Context Learning for LLMs — Senior Data Science Capstone
**Sponsor:** 99P Labs (Honda Research Institute) · **Team:** 6 · Jan–May 2026
**Published writeup:** https://medium.com/99p-labs/in-context-learning-for-llms-cd2051416904

**Research question:** How do large language models learn from context
alone, and how does that ability differ across three GPT-5 model tiers?

**My contributions:**
- Co-built **"bakeoff,"** a Python harness that ran the same prompts
  across all three models, auto-scored them against an answer key,
  tagged them by question type, and logged every trace to **Langfuse** —
  turning a slow manual testing process into an automated pipeline.
- Built a companion script that pulled our earlier hand-scored results
  into Langfuse, saving the team weeks of qualitative rework.
- Built an OpenCode/VS Code workflow that pushed code and refreshed the
  GitHub README from the terminal and auto-resolved routine merge
  conflicts, keeping documentation continuously current.
- In the **"Relationships" pod**, wrote 150 evaluation prompts and built
  conflicting "worlds" to probe six categories of model reasoning.
- Rotated in as **project manager** — ran sponsor meetings and kept a
  6-person team aligned through sprint calendars, timesheets, and notes.
- Co-authored the published Medium writeup and presented findings to the
  sponsor.

**Tools:** Python · Langfuse · OpenCode (VS Code) · Git/GitHub · GPT-5 model tiers

## Statistical Modeling & Research (R)

**Suspected Pay Inequality by Race & Region** — *SDS 291* · solo
Tested whether the Black–White weekly wage gap varies by region, holding
education and experience constant, using the March 1988 Current Population
Survey (~25,600 workers). Fit reduced and interaction linear-regression
models to isolate the regional effect.

**Buchanan's "False Votes" in the 2000 Presidential Election** — *SDS 291*
Investigated whether butterfly-ballot confusion in Palm Beach County
inflated Pat Buchanan's vote count. Built a log-transformed linear
regression on Florida's other 66 counties (Sleuth2 data) to predict
Buchanan's expected votes and quantify the Palm Beach excess.

**Student Behaviors & Exam Score** — *SDS 291* · team
Modeled which habits (study time, sleep, social media, mental health,
attendance) predict exam performance, using multiple regression, nested
F-tests, and quadratic terms to capture non-linear and interaction effects.

**Veteran Disability & Economic Vulnerability** — *SDS 300, Disability & Inclusion Data Analytics* · team
Used 2025 CPS ASEC data (~110K respondents) to test how veteran status and
disability relate to poverty risk — and whether veteran status moderates
racial, age, and gender disparities — via multiple logistic-regression
models. (R code `.Rmd` included.)

**Drug-Rehab Patient Characteristics & Primary Substance** — *SDS 390, Biostatistics & Epidemiology* · team
Applied multinomial logistic regression to the HELP clinical-trial data to
test whether age, gender, depression score (CES-D), and homelessness predict
a detox patient's primary substance (alcohol / cocaine / heroin).

## Machine Learning & Data Visualization

**Predicting Billboard Chart Success** — *CSC 293, Machine Learning* · team
Explored what makes a song chart: EDA and correlation analysis, unsupervised
clustering (hierarchical, k-means), then supervised models (random forest,
logistic regression, gradient boosting) to classify Top-10 songs — surfacing
streams, lyric sentiment, danceability, and TikTok virality as the strongest
predictors (~91% random-forest accuracy). *R.*

**World Happiness & Global Streaming Availability** — *SDS/CSC 235, Visual Analytics* · team
Built a visual-analytics story linking the 2019 World Happiness Report to
title availability across Netflix, Hulu, and HBO Max, exploring how media
access relates to national well-being.

## HCI / UX Research & Design

**"Foodies": A Smith Dining Website Case Study** — *CSC 256, Intro to HCI* · team
Mixed-methods UX study of how cultural-food representation in dining affects
POC and international students' sense of belonging: rapid recon, a campus
survey, interviews, a user persona, and low-fidelity prototypes (app,
website, and a live-feedback concept).

**Mutual Aid & Refugee Support: Ethnographic Study & Platform Intervention** — *CSC 356, Platform Activism Seminar* · team
Interviewed mutual-aid and refugee-support organizations to understand how
grassroots groups navigate online censorship, then designed a platform
concept to connect refugee communities with campus initiatives.

## Computational Linear Algebra (MATLAB)

**Image-Filtering Midterm** — *MTH 261, Computational Linear Algebra*
Applied matrix operations to images — color-channel manipulation, edge
detection, outline extraction, and foreground/background compositing — as
linear transformations.

**Photo-Editor App** — *MTH 261, Computational Linear Algebra*
Built an interactive photo editor in MATLAB App Designer with live sliders
(saturation, brightness, warmth, contrast, blur, sharpen) and one-click
filters (sepia, invert, outline, grainy), each implemented as a
linear-algebra image operation.

## Community Engagement Capstone

**Accessibility of Community Engagement: Recommendations for Compass 2035** — *Community Engagement & Social Change Concentration Capstone, Jandon Center* · team
Interviewed 25 people across five constituent groups (students, faculty,
admin, alumni, community partners) to find gaps in the accessibility of
Smith's community-engagement opportunities, then delivered actionable
recommendations (funding reallocation, departmental liaisons, transportation)
for the college's Compass 2035 strategic plan.

