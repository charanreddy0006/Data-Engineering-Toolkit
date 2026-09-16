from time import monotonic

def process_batch(records):
    started = monotonic()
    processed = 0
    for record in records:
        processed += 1
    return {
        "processed": processed,
        "duration_seconds": monotonic() - started
    }

if __name__ == "__main__":
    print(process_batch([1, 2, 3]))
