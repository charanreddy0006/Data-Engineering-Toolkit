#!/usr/bin/env python3
import sys

current_word = None
total = 0

for line in sys.stdin:
    word, value = line.rstrip().split("\t", 1)
    value = int(value)

    if current_word is not None and word != current_word:
        print(f"{current_word}\t{total}")
        total = 0

    current_word = word
    total += value

if current_word is not None:
    print(f"{current_word}\t{total}")
