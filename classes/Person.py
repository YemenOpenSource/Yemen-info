class Person:
    # GREEN, RED, REFACTOR
    def __init__(self):
        self._age = 0
        self._name = ""

    def set_name(self, name):
        self._name = name

    def get_name(self):
        return self._name

    def set_age(self, age):
        if not isinstance(age, int):
            raise ValueError("age must be int")

        if age <= 0:
            raise ValueError("age must be greater than 0")

        self._age = age

    def get_age(self):
        return self._age
