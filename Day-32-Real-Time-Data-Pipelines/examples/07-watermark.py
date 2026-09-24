class Watermark:
    def __init__(self, value=0):
        self.value = value
    def advance(self, timestamp):
        self.value = max(self.value, timestamp)

wm = Watermark()
for t in [10, 12, 11, 15]:
    wm.advance(t)
    print(wm.value)
