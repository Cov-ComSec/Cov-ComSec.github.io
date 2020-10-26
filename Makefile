MKDOCS_PORT=8008
INVENV = $(shell pip3 -V | grep 'csm_venv')
current_dir = $(shell pwd)

prereqs: venvcheck FORCE
	pip install -r requirements.txt

venv: FORCE
	python3 -m venv csm_venv

venvcheck:
ifeq ($(INVENV),)
	$(error You should only run this from within the venv. Use '. ./csm_venv/bin/activate')
else
	@echo "venv check passed\n"
endif


FORCE:




build: 
	mkdocs build --clean --config-file ./mkdocs.yaml

publish:
	mkdocs gh-deploy --config-file ./mkdocs.yaml --remote-branch gh-pages

serve:
	mkdocs serve --dev-addr localhost:$(MKDOCS_PORT) --config-file ./mkdocs.yaml

clean:
	-rm -rf ./site



