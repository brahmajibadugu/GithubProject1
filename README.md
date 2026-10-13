# Concept Summary

A four-page JSP learning exercise about Git. A learner reads `about.html`, writes a summary in `test.html`, submits it to `verify.jsp`, and sees the verified name, email, and summary in `display.html`.

## Run the web app

Requirements: JDK 17 or newer, Maven, and Apache Tomcat 10.1.

1. Build the WAR from this directory:

   ```powershell
   mvn clean package
   ```

2. Copy `target/concept-summary.war` into Tomcat's `webapps` directory and start Tomcat with `bin\startup.bat`.
3. Open `http://localhost:8080/concept-summary/about.html`.

The verification page accepts a name that begins with a capital letter and is shorter than 10 characters, an email ending in `@gmail.com`, and a non-empty summary. On success, the JSP safely transfers those values to browser session storage and opens the display page. This is a learning demo, not an authentication or data-storage system.

## Git exercise

Git identity is configured for this repository only; it does not change the global Git configuration.

```powershell
git init
git config user.name "Developer One"
git config user.email "developer1@example.com"
git status --short
git add .
git status --short
git commit -m "Create concept summary learning flow"
```

After the first commit, edit a tracked file such as this README. Inspect the unstaged change, stage it, inspect the staged change, and commit:

```powershell
git status --short
git diff -- README.md
git add README.md
git status --short
git diff --cached -- README.md
git commit -m "Document the Git workflow"
```

Inspect the available commits with each developer's name, email, and message:

```powershell
git log --all --pretty=format:"%h | %an | <%ae> | %s"
```
