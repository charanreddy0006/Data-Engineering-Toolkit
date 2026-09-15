# Hashing and Salting

## Purpose
A hash produces a digest rather than a recoverable plaintext value.

## Salting

A unique random salt prevents efficient reuse of precomputed password-hash tables.

## Warning

Do not design password storage with a fast general-purpose hash alone; use a suitable password-hashing scheme.

## Compare

Encryption is designed to be reversible with a key; hashing is designed for one-way verification.
