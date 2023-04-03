import pytest
from pytest import mark
@mark.order
def test_order():
  print("created ordered")
