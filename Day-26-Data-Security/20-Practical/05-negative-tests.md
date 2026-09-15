# Negative Security Tests
Security tests should verify denied actions, not only successful actions. Examples: analyst cannot read restricted columns; pipeline cannot delete unrelated tables; unauthorized Kafka consumer cannot read protected topics; expired access is denied.
