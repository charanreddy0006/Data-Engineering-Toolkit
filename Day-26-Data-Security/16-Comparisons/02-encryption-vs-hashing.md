# Encryption vs Hashing

## Purpose
Encryption protects recoverable confidentiality with keys; hashing produces a one-way digest.

## Rule

If the application must later recover the original value, a hash alone is not the mechanism. If it needs verification without recovery, hashing may be appropriate.
