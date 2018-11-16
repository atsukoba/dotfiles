#!/bin/bash

# AtsuyaKobayashi

## Requirements
# Python(Anaconda), nodejs, npm, 

## install of jupyter lab itself(if needed)
conda install -c conda-forge jupyterlab

## install of labextention
jupyter labextension list

## install ipywidgets 
conda install -c conda-forge ipywidgets

## install ipywidgets jupyterlab
# (if needed)
# jupyter lab clean

jupyter labextension install @jupyter-widgets/jupyterlab-manager

## install git extention
jupyter labextension install @jupyterlab/git
pip install jupyterlab-git
jupyter serverextension enable --py jupyterlab_git

## install jupyter-lab tensorboard
jupyter labextension install jupyterlab_tensorboard

## Rebuild JupyterLab packages
jupyter lab build
