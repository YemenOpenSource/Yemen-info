import pytest

from classes import Person
p1 = Person()

def test_person_age_is_5():
    p1.set_age(5)
    assert p1.get_age() == 5

def test_person_age_is_text():
    with pytest.raises(ValueError):
        p1.set_age("Abdullah")

def test_person_age_is_less_than_0():
    with pytest.raises(ValueError):
        p1.set_age(-9)

def test_person_age_is_greater_than_100():
    with pytest.raises(ValueError):
        p1.set_age(150)
