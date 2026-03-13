# desktop-app.md

- Renderer process follows front principles (UI only).
- Main process acts as local BFF: owns OS, file, and window management.
- Route cloud API calls through Cloudflare Gateway.
- Route local processing tasks to Python via IPC.
- Do not expose Python directly to renderer; mediate through main process.
- Keep browser-like session and assurance handling in the app boundary, not in renderer UI state alone.
- Do not let renderer-originated identity assertions bypass verified session or token context.
- Treat desktop credential mode as non-browser by default; do not import cookie/CSRF assumptions unless explicitly designed.
- Define whether the desktop app supports auto-update; do not leave update posture implicit.
- Do not let updater configuration silently change branch-to-channel mapping or release governance.
- Run a desktop-app smoke check when user-visible UI behavior changes.
- Define whether scripted visual or UI checks are required for the repository; do not leave UI verification posture implicit.
