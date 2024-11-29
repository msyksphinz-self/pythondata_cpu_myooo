import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

from pythondata_cpu_myooo import version_str

setuptools.setup(
    name="pythondata-cpu-myooo",
    version=version_str,
    author="LiteX Authors",
    author_email="litex@googlegroups.com",
    description="""\
Python module containing system_verilog files for Myooo cpu.""",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/msyksphinz-self/pythondata-cpu-myooo",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.5',
    zip_safe=False,
    packages=setuptools.find_packages(),
    package_data={
    	'cpu_myooo': ['cpu_myooo/system_verilog/**'],
    },
    include_package_data=True,
    project_urls={
        "Bug Tracker": "https://github.com/msyksphinz-self/pythondata-cpu-myooo/issues",
        "Source Code": "https://github.com/msyksphinz-self/pythondata-cpu-myooo",
    },
)
