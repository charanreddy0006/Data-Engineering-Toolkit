import logging

logging.basicConfig(
    filename="pipeline.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

logging.info("Pipeline Started")
logging.warning("Missing Values Found")
logging.error("Connection Timeout")

print("Logs written successfully.")