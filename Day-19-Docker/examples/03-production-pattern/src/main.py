import logging
import os
import time

import psycopg
from psycopg import OperationalError


logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(message)s",
)

logger = logging.getLogger(__name__)


def get_config():
    return {
        "host": os.getenv("DB_HOST", "postgres"),
        "port": os.getenv("DB_PORT", "5432"),
        "dbname": os.getenv("DB_NAME", "automotive"),
        "user": os.getenv("DB_USER", "data_engineer"),
        "password": os.getenv("DB_PASSWORD", "dev_password"),
        "connect_timeout": 3,
    }


def wait_for_database(max_attempts=10):
    config = get_config()

    for attempt in range(1, max_attempts + 1):
        try:
            with psycopg.connect(**config):
                logger.info("Database connection successful.")
                return

        except OperationalError as exc:
            logger.warning(
                "Database not ready. attempt=%s error=%s",
                attempt,
                exc,
            )

            if attempt == max_attempts:
                raise RuntimeError(
                    "Database did not become ready."
                ) from exc

            time.sleep(2)


def main():
    logger.info("ETL application startup.")
    wait_for_database()
    logger.info("Startup checks completed.")


if __name__ == "__main__":
    main()
