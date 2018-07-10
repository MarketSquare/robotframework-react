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

    def wait_for_react(self, reducer=None, stateName="isFetching"):

        seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
        status = None
        while True:
            if reducer:
                status = seleniumlib.execute_javascript(
                    "return !window.appStore.getState()['{0}'].{1}".format(
                        reducer,
                        stateName
                    )
                )
            else:
                status = seleniumlib.execute_javascript(
                    "return window.appStatus"
                )
            if status:
                break
        print(status)
