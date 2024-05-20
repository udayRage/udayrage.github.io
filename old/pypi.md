# [Main Menu](index.html)

#Install the necessary packages

    pip install -U -y pip-tools setuptools wheel twine
    

##Creating a project/folder to store source code

1. Let us call this project/folder as parentFolder.

       parentFolder

2. Do not write your code with in this parentFolder. It is used for setting up the repository.
3. Create a sub-folder in ParentFolder, say codeFolder. 

       parentFolder
       |
       |- codeFolder

    __Note:__ name the codeFolder with the same name as your PYPI repository

4. Write your source code in this codeFolder by creating necessary sub-folders.

       parentFolder
       |
       |- codeFolder
              |- code1.py
              |- code2.py
              |-subFolder
                   |- code3.py
                    ...

## Creating necessary files in parentFolder to upload to PYPI

###  Create empty \_\_init\_\_.py, setup.py, README.md, uploadPYPI.sh  and Licence files in the parentFolder

       parentFolder
       |
       |- __init__.py
       |- setup.py
       |- LICENCE
       |- uploadPYPI.sh    
       |- codeFolder
              |- code1.py
              |- code2.py
              |-subFolder 
                   |- code3.py
                   ...
       
### Copy and paste the below provided code in setup.py file. Make necessary changes in the text

        import setuptools

        with open('README.md', 'r') as fh:
        long_description = fh.read()

        setuptools.setup(
        name = '*************',             #set the package name
        version = '************',           #set the version number
        author = '**************',           #specify the author name 
        author_email = 'xxxxxxx@email.com',
        description = 'This software is being developed at the University of Aizu, Aizu-Wakamatsu, Fukushima, Japan',
        long_description = long_description,
        long_description_content_type = 'text/markdown',
        packages=setuptools.find_packages(),
        url = 'https://github.com/udayRage/geoAnalytics',  #URL of your github package or web page
        license='GPLv3',
        install_requires=[            # All necessary packages utilized by our PAMI software
            'psutil',
            'pandas',
            'matplotlib',
            'resource',
            'validators',
            'urllib3',
            'psycopg2-binary'
        ],
        classifiers = [
            'Development Status :: 3 - Alpha',      # Chose either "3 - Alpha", "4 - Beta" or "5 - Production/Stable" as the current state of your package
            'Programming Language :: Python :: 3',
            'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
            'Operating System :: OS Independent',
        ],
        python_requires = '>=3.5',
        )

### Copy the below code to automate the process of updating the code to PYPI

__Note:__ Replace ********   with the repository name

    echo "Uninstall old ******** version"
    pip uninstall -y ********

    echo "Running setup"
    python3 setup.py sdist bdist_wheel

    echo "Uploading to test repository"
    python3 -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*

    echo "Wait for 5 minute to update the repository"
    sleep 300

    echo "installing ******** from the testPYPI"
    python3 -m pip install --index-url https://test.pypi.org/simple/ --no-deps ********

    echo "Uploading ******** to main PYPI repository"
    python3 -m twine upload dist/*

    echo "Deleting unnecessary files"
    rm -rf dist/ ********.egg-info/ build/

    echo "Completed."

### Execute the below command on the terminal

    sh uploadPYPI.sh