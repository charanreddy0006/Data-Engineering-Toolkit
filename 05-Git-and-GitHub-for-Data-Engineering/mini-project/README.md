# Mini Project — Version Controlled Vehicle Data Pipeline

## Objective

Build a small vehicle data pipeline and manage the complete development lifecycle using Git and GitHub.

## Project Workflow

```text
Vehicle Dataset
      |
      v
Python Extraction
      |
      v
Data Validation
      |
      v
Transformation
      |
      v
Output Dataset
```

## Repository Workflow

```text
Issue
  |
  v
Feature Branch
  |
  v
Development
  |
  v
Testing
  |
  v
Commit
  |
  v
Pull Request
  |
  v
CI
  |
  v
Merge
```

## Project Structure

```text
pipeline-repository/
├── src/
│   ├── extract.py
│   ├── validate.py
│   └── transform.py
│
├── tests/
│   └── test_pipeline.py
│
├── data/
│   └── sample/
│
├── scripts/
│   └── run_pipeline.sh
│
├── .gitignore
└── README.md
```

## Features

- Vehicle CSV processing
- Basic validation
- Data transformation
- Automated tests
- Git version control
- Feature branch workflow

## Example Checks

The pipeline should validate:

- Vehicle ID
- Speed
- Fuel or battery level
- Missing values
- Duplicate records

## Git Workflow

```bash
git switch -c feature/vehicle-pipeline

git add .

git commit -m "Add vehicle data pipeline"

git push -u origin feature/vehicle-pipeline
```

Create a Pull Request on GitHub and merge after review.

## Learning Outcome

This project demonstrates how Git and GitHub can be integrated into a practical Data Engineering workflow.