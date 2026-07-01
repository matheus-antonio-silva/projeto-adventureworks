"Contains profile mappings used in the project"

import os
from pathlib import Path

from cosmos import ProfileConfig

airflow_db = ProfileConfig(
    profile_name="dbt_adventure_works",
    target_name=os.environ.get("DBT_TARGET", "dev"),
    profiles_yml_filepath=Path("/usr/local/airflow/dags/dbt/adventure_works/profiles.yml"),
)
