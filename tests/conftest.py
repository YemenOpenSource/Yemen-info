import pytest
from utilities.json2xml import xMl


@pytest.fixture(scope="function")  # means this root fixture will be created before every test, and deleted after it
def root():
    root = xMl.Element("root")
    yield root
    del root


def pytest_itemcollected(item):
    """
    This hook is to print the function name and docstring on the console after the test
    if the test doesn't contain a docstring, the test name will be printed
    """
    node = item.obj
    suf = (node.__name__, node.__doc__.strip()) if node.__doc__ else (node.__name__, "")
    if suf:
        item._nodeid = ' '.join(suf)
