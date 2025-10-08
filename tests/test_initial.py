

# from app import add

# def test_add():
#     print("start of test")
#     assert add(3,4) == 7
#     print("end of test")

# tests/test_initial.py
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from app import add

def test_add_numbers():
    assert add(3, 4) == 7

def test_negative_test():
    assert add(3, 4) != 8 # negative checking

def test_add_zero():
    assert add(0, 0) == 0
