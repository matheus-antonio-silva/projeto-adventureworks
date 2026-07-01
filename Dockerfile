FROM astrocrpublic.azurecr.io/runtime:3.2-5

# install dbt into a virtual environment
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-bigquery && deactivate

# mount point for production credentials at runtime
RUN mkdir -p /usr/local/airflow/.credentials