# Capstone Test Cases

## Functional
- Entity keys resolve correctly.
- Features are generated for expected vehicles.
- Windows include the intended events.

## Time
- Future events are excluded from training features.
- Late events are handled according to policy.
- Time zones are normalized.

## Quality
- Battery SOC remains between 0 and 100.
- Distance is non-negative.
- Null keys fail validation.

## Serving
- Required features can be retrieved by vehicle ID.
- Missing features follow documented fallback behavior.

## Security
- Unauthorized identities cannot read restricted features.
