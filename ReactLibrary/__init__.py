# -*- coding: utf-8 -*-
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn

__version__ = '1.0'
ROBOT_LIBRARY_DOC_FORMAT = 'reST'


class ReactLibrary:
    """ReactLibrary is a library to introspect the state of a React app.
    """

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        pass

    def wait_until_react_app_is_fully_loaded(self):

        selenium2lib = BuiltIn().get_library_instance('Selenium2Library')
        while True:
            status = selenium2lib.execute_javascript(
                "return window.appStatus"
            )
            if status:
                break
        print status
