# Some optional linting

PYTHON_SCRIPT=files/check_podman

YAMLLINT=@if which yamllint > /dev/null; then yamllint .; fi
ANSIBLELINT=@if which ansible-lint > /dev/null; then ansible-lint -q .; fi
PYLINT=@if which pylint > /dev/null; then if test -f $(PYTHON_SCRIPT); then pylint -d C0103 $(PYTHON_SCRIPT); fi; fi
RUFFLINT=@if which ruff > /dev/null; then if test -f $(PYTHON_SCRIPT); then ruff $(PYTHON_SCRIPT); fi; fi

test:
	$(YAMLLINT)
	$(ANSIBLELINT)
	$(PYLINT)
	$(RUFFLINT)
