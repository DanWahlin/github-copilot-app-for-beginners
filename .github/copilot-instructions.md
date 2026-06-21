# GitHub Copilot instructions

Use these instructions when working in this repository.

## Sample app scope

- The canonical app is `samples/book-app-web`.
- Do not edit chapter README files unless the user asks for chapter content changes.
- Keep the app frontend-only. Do not add a backend, database, or external service.
- Prefer small React components with clear props over broad abstractions.
- Keep beginner course language natural, direct, and friendly.

## App style

- Use Vite, React, TypeScript, and Vitest.
- Keep seed data in `samples/book-app-web/src/data/books.ts`.
- Use accessible labels for filters, regions, and empty states.
- Keep CSS readable and local to `src/styles/app.css`.
- Avoid hard-coded business rules outside the component or data module that owns them.

## Validation

From `samples/book-app-web`, run:

```bash
npm test -- --run
npm run build
```

If dependencies are missing, run `npm install` first.

## Course scenario guidance

- The default app should pass tests.
- Keep intentional failing behavior in scenario docs or training branches, not in the default app.
- When fixing scenario issues, prefer adding or preserving a focused test before changing app logic.
