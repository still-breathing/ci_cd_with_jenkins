

from app import add

def test_add():
    print("start of test")
    assert add(3,4) == 7
    print("end of test")