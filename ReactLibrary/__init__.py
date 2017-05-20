# -*- coding: utf-8 -*-
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn

__version__ = '1.0'
ROBOT_LIBRARY_DOC_FORMAT = 'reST'


class ReactLibrary:
    """WebpackLibrary is a library to start and stop Webpack Dev Server.
    """

    # TEST CASE => New instance is created for every test case.
    # TEST SUITE => New instance is created for every test suite.
    # GLOBAL => Only one instance is created during the whole test execution.
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        """WebpackLibrary can be imported with optional arguments.
        """
        pass

    def wait_until_react_app_is_fully_loaded(self):
        """Start Webpack Dev Server."""
        logger.console("-" * 78)
        logger.console("wait_unit_react_app_is_fully_loaded")
        logger.console("-" * 78)

        selenium2lib = BuiltIn().get_library_instance('Selenium2Library')
        while True:
            status = selenium2lib.execute_javascript(
                "return window.appStatus"
            )
            if status:
                break
        print status
