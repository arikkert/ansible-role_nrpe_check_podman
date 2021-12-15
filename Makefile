# Some optional linting

PYTHON_SCRIPT=files/check_podman

YAMLLINT=@if which yamllint > /dev/null; then yamllint .; fi
ANSIBLELINT=@if which ansible-lint > /dev/null; then ansible-lint .; fi
PYLINT=@if which pylint > /dev/null; then if test -f $(PYTHON_SCRIPT); then pylint -d C0103 $(PYTHON_SCRIPT); fi; fi
PLAYBOOK=ansible-playbook $(OPTIONS) $@.yml

test:
	$(YAMLLINT)
	$(ANSIBLELINT)
	$(PYLINT)
