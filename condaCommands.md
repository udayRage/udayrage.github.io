# [Main Menu](index.html)

## Basic Conda commands

Create an environment

    conda create --name environmentName

Activate an environment

    conda activate environmentName

Clone an environment:

    conda create --clone cloneEnvironment --name mainEnvironmentName

Delete an environment:

    conda env remove --name environmentName

Deactivate an environment:

    conda deactivate

Install a package in conda:

    conda install packageName

Update a package in conda:

    conda update packageName

List the history of current environment:

    conda list --revisions

Restore Conda to previous revisions

    conda install --revisions number    #E.g., conda install --revisions 2