[![CI](https://github.com/talhag3/string-analyzer/actions/workflows/ci.yml/badge.svg)](https://github.com/talhag3/string-analyzer/actions/workflows/ci.yml)
[![Latest Stable Version](https://poser.pugx.org/talhag3/string-analyzer/v/stable)](https://packagist.org/packages/talhag3/string-analyzer)
[![Total Downloads](https://poser.pugx.org/talhag3/string-analyzer/downloads)](https://packagist.org/packagestalhag3/string-analyzer)

# 📝 String Analyzer

A minimal PHP library that analyzes a given string and returns counts for characters, words, spaces, and special characters.

Built as a **hands-on learning project** to master modern PHP development workflows: Docker, PHPUnit, Xdebug, GitHub Actions, and CI/CD.

---

## 🚀 Quick Start

```bash
# 1. Clone the repository
git clone <your-repo-url>
cd string-analyzer

# 2. Build the Docker environment
make build

# 3. Run tests
make test
```

---

## 📦 Features
- ✅ Single, pure method: `analyze(string $text): array`
- ✅ UTF-8 safe (`mb_*` & `preg_*` functions)
- ✅ PHPUnit test suite with assertions
- ✅ Xdebug integration for step-debugging & code coverage
- ✅ Fully containerized with Docker & Docker Compose
- ✅ Automated CI via GitHub Actions

---

## 🛠️ Prerequisites
- [Docker](https://www.docker.com/products/docker-desktop/) & Docker Compose
- `make` (pre-installed on macOS/Linux; Windows users can run `docker compose` commands directly)
- [VS Code](https://code.visualstudio.com/) + [PHP Debug Extension](https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-debug) *(for debugging)*

---

## 🧪 Testing & Coverage

| Command | Description |
|---------|-------------|
| `make test` | Run PHPUnit tests in an isolated container |
| `make test-coverage` | Generate HTML coverage report in `coverage/` |
| `make shell` | Drop into an interactive container shell |

> 💡 Code coverage requires Xdebug. Run `make test-coverage` and open `coverage/index.html` in your browser.

---

## 🐛 Debugging with VS Code

1. Install the **PHP Debug** extension by `felixfbecker`
2. Open the Debug panel (`Ctrl+Shift+D`), select **Docker: Listen for Xdebug**, and click ▶️
3. Set a breakpoint in `src/StringAnalyzer.php`
4. Run `make test` in the terminal
5. VS Code will pause at your breakpoint. Step, inspect variables, and continue.

*Configuration is pre-loaded in `.vscode/launch.json` and `Dockerfile`.*

---

## 🐳 Docker Explained (Learning Focus)

This project uses Docker to guarantee a **consistent, reproducible environment** across machines and CI.

- `Dockerfile` → Bakes PHP 8.2 + extensions (Xdebug, intl, mbstring, Composer) into an image
- `docker-compose.yml` → Orchestrates the container, mounts your code live (`volumes`), and configures Xdebug routing
- `make` commands → Wrap long `docker compose run ...` calls for convenience

> 🔑 **Key Concept:** Code changes sync instantly via `volumes`. You only rebuild (`make build`) when modifying the `Dockerfile` or PHP extensions.

---

## 🔄 GitHub Actions CI

Pushing to `main` or opening a PR automatically triggers:
- ✅ PHP 8.2 setup with Xdebug
- ✅ Dependency installation
- ✅ PHPUnit execution with coverage
- ✅ Coverage artifact upload

Workflow file: `.github/workflows/ci.yml`

---

## 📁 Project Structure

```
string-analyzer/
├── src/
│   └── StringAnalyzer.php      # Core logic
├── tests/
│   └── StringAnalyzerTest.php  # PHPUnit tests
├── .github/workflows/ci.yml    # GitHub Actions CI
├── .vscode/launch.json         # VS Code debug config
├── Dockerfile                  # PHP environment + Xdebug
├── docker-compose.yml          # Container orchestration
├── Makefile                    # Developer shortcuts
├── composer.json               # Dependencies & autoloading
└── phpunit.xml                 # Test configuration
```

---

## 📚 Learning Objectives
This project demonstrates:
- How Composer autoloading & `composer.json` work
- Writing & running PHPUnit tests
- Configuring Xdebug for CLI debugging & coverage
- Containerizing PHP apps without local dependency conflicts
- Automating tests with GitHub Actions
- Using `volumes` vs `COPY` in Docker (dev vs prod)

---

## 📄 License
MIT License. Free to use, modify, and learn from.
