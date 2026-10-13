<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
  private String escapeHtml(String value) {
    return value.replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
        .replace("\"", "&quot;")
        .replace("'", "&#39;");
  }
%>
<%
  request.setCharacterEncoding("UTF-8");
  if (!"POST".equalsIgnoreCase(request.getMethod())) {
    response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Submit the test form first.");
    return;
  }

  String name = request.getParameter("name");
  String email = request.getParameter("email");
  String summary = request.getParameter("summary");
  name = name == null ? "" : name.trim();
  email = email == null ? "" : email.trim();
  summary = summary == null ? "" : summary.trim();

  boolean validName = !name.isEmpty() && name.length() < 10 && Character.isUpperCase(name.charAt(0));
  boolean validEmail = email.toLowerCase(java.util.Locale.ROOT).endsWith("@gmail.com");
  boolean validSummary = !summary.isEmpty() && summary.length() <= 2000;

  if (!validName || !validEmail || !validSummary) {
    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Verification needs attention | Concept Notes</title>
  <link rel="stylesheet" href="assets/site.css">
</head>
<body>
  <header class="topbar">
    <a class="wordmark" href="about.html">FIELDNOTES <span>/ LEARN</span></a>
    <nav aria-label="Main navigation"><a href="about.html">About</a><a class="active" href="test.html">Test</a></nav>
  </header>
  <main class="page-grid">
    <aside class="side-label"><span>03 / CHECK</span><span>TRY AGAIN</span></aside>
    <section class="content">
      <p class="eyebrow">Not quite yet</p>
      <h1>Check your<br>details.</h1>
      <p class="intro">Your response was not accepted. Please return to the test and check the highlighted rules:</p>
      <ul class="error-list">
        <% if (!validName) { %><li>Name must start with a capital letter and contain fewer than 10 characters.</li><% } %>
        <% if (!validEmail) { %><li>Email address must end in @gmail.com.</li><% } %>
        <% if (!validSummary) { %><li>Write a summary of the Git concept before submitting.</li><% } %>
      </ul>
      <a class="primary-link" href="test.html">Return to the test <span aria-hidden="true">↗</span></a>
    </section>
  </main>
  <footer>CONCEPT NOTES <span>03 — VERIFICATION</span></footer>
</body>
</html>
<%
    return;
  }
%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Verified | Concept Notes</title>
</head>
<body>
  <p>Details verified. Opening your summary...</p>
  <div hidden>
    <input id="verified-name" value="<%= escapeHtml(name) %>">
    <input id="verified-email" value="<%= escapeHtml(email) %>">
    <textarea id="verified-summary"><%= escapeHtml(summary) %></textarea>
  </div>
  <script>
    sessionStorage.setItem("conceptSummary.name", document.getElementById("verified-name").value);
    sessionStorage.setItem("conceptSummary.email", document.getElementById("verified-email").value);
    sessionStorage.setItem("conceptSummary.text", document.getElementById("verified-summary").value);
    window.location.replace("display.html");
  </script>
</body>
</html>
