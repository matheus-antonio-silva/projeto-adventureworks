"Contains profile mappings used in the project"

from cosmos import ProfileConfig
from cosmos.profiles.bigquery import GoogleCloudServiceAccountFileProfileMapping

airflow_db = ProfileConfig(
    profile_name="dbt_adventure_works",
    target_name="dev",
    profile_mapping=GoogleCloudServiceAccountFileProfileMapping(
        conn_id="my_google_cloud_platform_connection",
        profile_args={
            "project": "curso-gpc-466620",
            "dataset": "dbt-matheus",
            "keyfile": "/usr/local/airflow/.credentials/gcp-dev-key.json",
        },
    ),
)
