SHELL := /bin/bash

.PHONY: build test test-coverage shell release patch minor major

# ==========================================
# 🐳 Development & Testing
# ==========================================
build:
	docker compose build

test:
	docker compose run --rm php vendor/bin/phpunit

test-coverage:
	docker compose run --rm php php -d xdebug.mode=coverage vendor/bin/phpunit --coverage-html coverage

shell:
	docker compose run --rm php bash

# ==========================================
# 📦 Versioning & Publishing
# ==========================================
# 🔹 Exact version: make release V=1.0.0
release:
	@if [ -z "$(V)" ]; then echo "❌ Usage: make release V=1.0.0"; exit 1; fi
	@if [ -n "$$(git status --porcelain)" ]; then echo "❌ Error: Working tree is dirty. Commit or stash changes first."; exit 1; fi
	@echo "📦 Preparing release v$(V)..."
	@git add -A
	@git commit -m "chore: release v$(V)"
	@git tag -a v$(V) -m "Release v$(V)"
	@git push origin master --tags
	@echo "✅ Published v$(V) to GitHub. Packagist will auto-sync."

# 🔸 Auto-increment helpers (reads latest tag & bumps)
patch:
	@V=$$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//' || echo "0.0.0"); \
	IFS='.' read -r MAJ MIN PAT <<< "$$V"; \
	$(MAKE) --no-print-directory release V="$$MAJ.$$MIN.$$((PAT + 1))"

minor:
	@V=$$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//' || echo "0.0.0"); \
	IFS='.' read -r MAJ MIN PAT <<< "$$V"; \
	$(MAKE) --no-print-directory release V="$$MAJ.$$((MIN + 1)).0"

major:
	@V=$$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//' || echo "0.0.0"); \
	IFS='.' read -r MAJ MIN PAT <<< "$$V"; \
	$(MAKE) --no-print-directory release V="$$((MAJ + 1)).0.0"