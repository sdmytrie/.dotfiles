from typing import Any

from matplotlib.artist import Artist


class Legend(Artist):
    def __getattr__(self, name: str) -> Any: ...  # incomplete


def __getattr__(name: str) -> Any: ...  # incomplete
