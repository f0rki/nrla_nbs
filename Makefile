DOCKER_TAG=nrla-nbs

jupyter-virtualenv:
	mkvirtualenv jupyter -p `which python2` --system-site-packages
	workon jupyter && pip install --upgrade jupyter

install-archlinux:
	sudo pacman -Syu --needed jupyter jupyter-notebook sagemath ipython2-notebook mathjax

install-ubuntu:
	sudo apt-add-repository -y ppa:aims/sagemath
	sudo apt-get update
	sudo apt-get install sagemath-upstream-binary
	sudo apt-get install virtualenvwrapper bash-completion
	make jupyter-virtualenv

docker-build:
	docker build -t $(DOCKER_TAG) .

docker-run:
	docker run -i -t -p 8888:8888 -v `pwd`:/notebooks $(DOCKER_TAG)
