import os
# Illustrative only: production secrets should come from an approved secret manager or workload identity.
host=os.environ.get("DATABASE_HOST")
name=os.environ.get("DATABASE_NAME")
if not host or not name: raise RuntimeError("Required configuration missing")
print("Configured database target:", host, name)
