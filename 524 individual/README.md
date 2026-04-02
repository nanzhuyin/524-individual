# Personal Job-Seeking Website

This project is a static one-page portfolio website prepared for a university individual assignment. It is designed for direct deployment on GitHub Pages and includes the required sections: Home, About Me, Skills, Projects, Resume / CV, and Contact.

The site includes a downloadable resume PDF and report PDFs for both featured projects, so the portfolio can present direct supporting materials during marking.

## Folder Structure

```text
.
├── assets/
│   └── files/
│       ├── Lingnan-CrownCred-Group-Project-Report.pdf
│       ├── Tank-War-Game-AI-Based-on-Q-Learning-Report.pdf
│       └── YIN-Nanzhu-Resume.pdf
├── index.html
├── styles.css
├── script.js
├── README.md
├── submission-note-template.md
└── scripts/
    └── validate-site.sh
```

## Local Preview

Open `index.html` directly in a browser, or run a simple local server from the project folder:

```bash
python3 -m http.server 8000
```

Then visit `http://localhost:8000`.

## Validation

Run the built-in content check before submission:

```bash
./scripts/validate-site.sh
```

## Deploy to GitHub Pages

1. Create a GitHub repository and upload this project.
2. Make sure `index.html` is in the repository root.
3. In GitHub, open `Settings` → `Pages`.
4. Under `Build and deployment`, choose `Deploy from a branch`.
5. Select the `main` branch and the `/ (root)` folder.
6. Save the settings and wait for GitHub Pages to publish the site.
7. Copy the generated GitHub Pages URL for your submission document.

## Included Documents

The project already contains the resume PDF and two project report PDFs in `assets/files/`, and the website links to them directly.
