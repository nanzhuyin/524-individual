#!/bin/zsh

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
INDEX_FILE="$ROOT_DIR/index.html"
README_FILE="$ROOT_DIR/README.md"
SUBMISSION_NOTE_FILE="$ROOT_DIR/submission-note-template.md"
RESUME_FILE="$ROOT_DIR/assets/files/YIN-Nanzhu-Resume.pdf"
INDIVIDUAL_REPORT_FILE="$ROOT_DIR/assets/files/Tank-War-Game-AI-Based-on-Q-Learning-Report.pdf"
GROUP_REPORT_FILE="$ROOT_DIR/assets/files/Lingnan-CrownCred-Group-Project-Report.pdf"

fail() {
  echo "ERROR: $1" >&2
  exit 1
}

[[ -f "$INDEX_FILE" ]] || fail "Missing index.html"
[[ -f "$README_FILE" ]] || fail "Missing README.md"
[[ -f "$SUBMISSION_NOTE_FILE" ]] || fail "Missing submission-note-template.md"
[[ -f "$RESUME_FILE" ]] || fail "Missing downloadable resume PDF"
[[ -f "$INDIVIDUAL_REPORT_FILE" ]] || fail "Missing individual project report PDF"
[[ -f "$GROUP_REPORT_FILE" ]] || fail "Missing group project report PDF"

for section_id in home about skills projects resume contact; do
  grep -q "id=\"$section_id\"" "$INDEX_FILE" || fail "Missing section #$section_id"
done

grep -q "AI Product / Blockchain-Web3 / Data Analysis Internship" "$INDEX_FILE" || fail "Missing internship target headline"
grep -q "Current Research / In Progress" "$INDEX_FILE" || fail "Missing in-progress research section"
grep -q "Multi-Agent Smart Contract Security Detection Project" "$INDEX_FILE" || fail "Missing multi-agent research project"
grep -q "Cross-Chain Bridge Smart Contract Security Review Writing" "$INDEX_FILE" || fail "Missing cross-chain bridge research project"
grep -q "Tank War Game AI Based on Q-Learning" "$INDEX_FILE" || fail "Missing Tank War project"
grep -q "Lingnan CrownCred (EduReward)" "$INDEX_FILE" || fail "Missing CrownCred project"
grep -q "Problem" "$INDEX_FILE" || fail "Project structure labels not found"
grep -q "My Contribution" "$INDEX_FILE" || fail "Missing contribution label"
grep -q "kakaxiyidaqi@gmail.com" "$INDEX_FILE" || fail "Missing contact email"
grep -q "assets/files/YIN-Nanzhu-Resume.pdf" "$INDEX_FILE" || fail "Missing resume PDF link"
grep -q "assets/files/Tank-War-Game-AI-Based-on-Q-Learning-Report.pdf" "$INDEX_FILE" || fail "Missing individual project report link"
grep -q "assets/files/Lingnan-CrownCred-Group-Project-Report.pdf" "$INDEX_FILE" || fail "Missing group project report link"
grep -q "YIN Nanzhu" "$INDEX_FILE" || fail "Missing English name presentation"
grep -q 'hero-heading-row' "$INDEX_FILE" || fail "Missing optimized horizontal hero heading layout"
grep -q 'hero-title-wide' "$INDEX_FILE" || fail "Missing wide hero title treatment"
grep -q 'about-heading-grid' "$INDEX_FILE" || fail "Missing optimized about heading layout"
grep -q "GitHub Pages" "$README_FILE" || fail "README must include GitHub Pages deployment steps"
grep -q "5597371" "$SUBMISSION_NOTE_FILE" || fail "Submission note must include student ID from source materials"

project_count="$(grep -c 'class="project-card"' "$INDEX_FILE" || true)"
[[ "$project_count" -eq 2 ]] || fail "Expected exactly 2 project cards, found $project_count"

echo "Validation passed."
