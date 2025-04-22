from dagster import job, op, resource
import requests
import os


@resource()
def dbt_cloud_resource(_):
    def trigger_job():
        headers = {
            "Authorization": f"Token {os.getenv('DBT_API_TOKEN')}",
            "Content-Type": "application/json",
        }
        url = f"https://cloud.getdbt.com/api/v2/accounts/{os.getenv('DBT_ACCOUNT_ID')}/jobs/{os.getenv('DBT_JOB_ID')}/run/"
        response = requests.post(url, headers=headers)
        response.raise_for_status()
        return response.json()

    return {"trigger_job": trigger_job}


@op(required_resource_keys={"dbt_cloud"})
def trigger_dbt_job(context):
    result = context.resources.dbt_cloud["trigger_job"]()
    context.log.info(f"DBT Cloud Job Triggered: {result}")


@job(resource_defs={"dbt_cloud": dbt_cloud_resource})
def run_dbt_from_dagster():
    trigger_dbt_job()
