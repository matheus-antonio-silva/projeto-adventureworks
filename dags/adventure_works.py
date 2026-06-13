from datetime import datetime

from cosmos import DbtDag, ProjectConfig

from include.constants import projeto_adventure_works, venv_execution_config
from include.profiles import airflow_db

adventure_works_dag = DbtDag(
    project_config=ProjectConfig(projeto_adventure_works),
    profile_config=airflow_db,
    execution_config=venv_execution_config,
    schedule="@daily",
    start_date=datetime(2023, 1, 1),
    catchup=False,
    dag_id="adventure_works",
    default_args={"owner": "Astro", "retries": 2},
    tags=["dbt", "adventure_works"],
)
