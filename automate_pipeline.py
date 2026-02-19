import subprocess
import os

def run_dbt_pipeline():
    print("🚀 Starting Olist Data Pipeline...")
    
    dbt_path = "./dbt-env/bin/dbt"

    print("--- Running Models ---")
    run_result = subprocess.run([dbt_path, "run", "--select", "fct_orders"], capture_output=True, text=True)
    
    if run_result.returncode == 0:
        print("✅ Models built successfully!")
    else:
        print("❌ Model Build Failed!")
        print(run_result.stderr)
        return

    print("--- Running Data Quality Tests ---")
    test_result = subprocess.run([dbt_path, "test", "--select", "fct_orders"], capture_output=True, text=True)
    
    if test_result.returncode == 0:
        print("✅ All data tests passed! Revenue is verified.")
    else:
        print("⚠️ Data Quality Alert: Some tests failed!")
        print(test_result.stdout)

if __name__ == "__main__":
    run_dbt_pipeline()