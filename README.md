# NRLA jupyter/sage notebooks

A couple of notebook for jupyter using sage kernel, that implement some of the
algorithms from the course "Numerisches Rechnen und Lineare Algebra".

These make it easy to check solutions for homework or during studying.
Intermediate results are also printed, so this makes it easy to locate errors.


## Running the notebooks

You need jupyter, ipython and sage to run the notebooks. All in relatively new
versions. If you got all dependencies then just launch:

    jupyter notebook

which will probably open your browser. Otherwise open [](http://localhost:8888)
and select the notebook you want to run.

## Installation

You need a sage version of at least 6.10, which means it's probably not packaged
in your favorite distribution. Archlinux ships relatively recent sage versions
and on Ubuntu there's a PPA. Then you also need a fairly new jupyter version
with a compatible notebook and ipython kernel.

### Arch Linux

On Arch Linux you can get everything by running

    pacman -S jupyter jupyter-notebook sagemath ipython2-notebook mathjax

should do the trick. This is scripted as `make install-archlinux`.

### Ubuntu

Add the sage PPA to get the latest sage version:

    apt-add-repository -y ppa:aims/sagemath
    apt-get update
    apt-get install sagemath-upstream-binary

And then you can get the latest jupyter with `pip`

    pip install --upgrade jupyter

I suggest you do it in a python virtualenv (using virtualenvwrapper):

    mkvirtualenv jupyter --system-site-packages
    workon jupyter
    pip install --upgrade jupyter

This is scripted as `make install-ubuntu`.

### Docker

A Dockerfile is provided to run the jupyter server. If you have docker already
installed you can use the makefile

    sudo make docker-build
    sudo make docker-run

## Warning

![I have no idea what I'm doing.](http://www.quickmeme.com/img/e3/e33bfc443d2cc3fcb79c254bd94ed1dfc1fe9d37d107d150a26a5e8e52fad0b0.jpg)
