from setuptools import setup, find_packages

version = '1.0.0a2'

long_description = (
    open('README.rst').read() +
    '\n' +
    '\n' +
    open('CHANGES.rst').read() +
    '\n')

setup(
    name='robotframework-react',
    version=version,
    description="A Robot Framework library for React.",
    long_description=long_description,
    classifiers=[
        'Development Status :: 3 - Alpha',
        'License :: OSI Approved :: Apache Software License',
        'Environment :: Web Environment',
        'Framework :: Robot Framework',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: Implementation :: CPython',
    ],
    # Get strings from http://pypi.python.org/pypi?%3Aaction=list_classifiers
    keywords='robotframework react javascript',
    author='Timo Stollenwerk & David Rodriguez Fuentes',
    author_email='stollenwerk@kitconcept.com',
    url='https://kitconcept.com',
    license='Apache License 2.0',
    packages=find_packages(
        exclude=['ez_setup', 'examples', 'tests']
    ),
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        'robotframework',
        'robotframework-seleniumlibrary>=3.0.0',
    ],
    entry_points="""
    # -*- Entry points: -*-
    """,
)
