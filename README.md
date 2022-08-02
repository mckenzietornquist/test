This repository is intended to be used as a skeleton repository for stock-specific projects.

## Starting a new project

The steps are:

1. Create a repository for the project, and clone it
2. 
2. Configure the characterisation and CPUE reports via the specific `setup.sql` files
3. Push changes to a different new project specific location
4. Set up gateaux reports to extract the characterisation data, run the CPUE models, and compile the FAR

# Adding ghoti submodule

The ghoti submodule can be added to a project by:

1. Add the ghoti submodule to the project: `git submodule add git@github.com:kahawai-collective/ghoti.git`
2. git submodule init
3.  Run ```git submodule update --merge --remote ``` in the local copy of the project repo
