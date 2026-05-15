CASK_FILES := $(filter-out %.rb.in,$(wildcard Casks/*.rb))
CASK_NAMES := $(patsubst Casks/%.rb,%,$(CASK_FILES))
TAP        := jchonig/casks

.PHONY: style style-fix audit test update

# Check style on all cask files (run this before committing)
style:
	brew style $(CASK_FILES)

# Auto-fix correctable style issues
style-fix:
	brew style --fix $(CASK_FILES)

# Audit casks — requires the tap to be registered (works in CI and after 'brew tap')
audit:
	brew audit --cask $(addprefix $(TAP)/,$(CASK_NAMES))

# Full test suite (style + audit)
test: style audit

# Run all cask update scripts
update:
	for script in scripts/update-*; do "$$script"; done
