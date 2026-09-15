# Tokenization

## Purpose
Tokenization replaces a sensitive value with a controlled surrogate token.

## Pattern

```text
Sensitive Value → Token Service/Vault → Token
                         ↓
                  Controlled recovery
```

## Benefit

Applications can use stable tokens while reducing direct exposure of original values.
