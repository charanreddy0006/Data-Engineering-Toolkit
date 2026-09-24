# 16. Late Events

An event is late when it arrives after the processing system expected it.

Example:
```text
event_time = 10:01
arrival     = 10:08
```

## Strategies
- allowed lateness
- update previous result
- correction stream
- explicit drop policy when justified

## Automobile
Vehicle connectivity interruptions can create bursts of older events after reconnect.

Define maximum expected lateness and correction behavior explicitly.
