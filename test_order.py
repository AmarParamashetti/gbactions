import pytest
from pytest import mark
@mark.order
def test_order():
  print("created ordered")
  
@mark.hello
def test_order():
  print("hello in created ordered")  
