def quality_gate(total, invalid, duplicates):
    if total <= 0:
        return False

    invalid_rate = invalid / total
    duplicate_rate = duplicates / total

    return invalid_rate <= 0.005 and duplicate_rate <= 0.001


if __name__ == "__main__":
    samples = [
        (10000, 20, 5),
        (10000, 80, 5),
    ]

    for total, invalid, duplicates in samples:
        status = quality_gate(total, invalid, duplicates)
        print("PASS" if status else "FAIL")
