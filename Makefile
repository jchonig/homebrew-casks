CASK_FILES    := $(filter-out %.rb.in,$(wildcard Casks/*.rb))
CASK_NAMES    := $(patsubst Casks/%.rb,%,$(CASK_FILES))
FORMULA_FILES := $(filter-out %.rb.in,$(wildcard Formula/*.rb))
FORMULA_NAMES := $(patsubst Formula/%.rb,%,$(FORMULA_FILES))
TAP           := jchonig/casks

.PHONY: style style-fix audit test update

# Check style on all cask and formula files (run this before committing)
style:
	brew style $(CASK_FILES) $(FORMULA_FILES)

# Auto-fix correctable style issues
style-fix:
	brew style --fix $(CASK_FILES) $(FORMULA_FILES)

# Audit casks and formulas — requires the tap to be registered (works in CI and after 'brew tap')
audit:
	$(if $(CASK_NAMES),brew audit --cask $(addprefix $(TAP)/,$(CASK_NAMES)))
	$(if $(FORMULA_NAMES),brew audit $(addprefix $(TAP)/,$(FORMULA_NAMES)))

# Full test suite (style + audit)
test: style audit

# Run all cask/formula update scripts; a failing script doesn't stop the rest,
# but the target exits non-zero at the end if any script failed.
update:
	@fail=0; \
	for script in scripts/update-*; do \
		echo "==> Running $$script"; \
		"$$script"; rc=$$?; \
		if [ $$rc -ne 0 ]; then \
			echo "!!! $$script failed (exit $$rc)" >&2; \
			fail=1; \
		fi; \
	done; \
	exit $$fail
