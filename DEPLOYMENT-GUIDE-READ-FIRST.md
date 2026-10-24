# GALUMBRA SUPREME — Read This First

This is a structured React + Vite starter project, prepared to address the build error:
`Failed to resolve /src/main.jsx`.

## What this package contains
- `index.html` and `package.json` at the repository root
- `src/main.jsx`, `src/App.jsx`, `src/style.css`, and `src/supabase.js`
- `supabase/schema.sql` for the starter database structure
- `wrangler.jsonc` to tell Cloudflare Workers how to serve the built `dist` website
- `README.md`, `.env.example`, and `.gitignore`

## Important: do not upload the ZIP file as if it were the source code
Cloudflare needs the files extracted into the GitHub repository. The repository root should look like this:

```text
galumbra-supreme/
├── index.html
├── package.json
├── wrangler.jsonc
├── README.md
├── .env.example
├── src/
│   ├── main.jsx
│   ├── App.jsx
│   ├── style.css
│   └── supabase.js
└── supabase/
    └── schema.sql
```

The folder must be named exactly `src` (lowercase). `main.jsx` must be inside it.

## Cloudflare build settings
For the Worker project using `wrangler.jsonc`:
- Build command: `npm run build`
- Deploy command: `npx wrangler deploy`
- Root directory: `/` (repository root)

The build creates `dist/`. `wrangler.jsonc` configures Cloudflare to serve the files from `dist/`.

If your Cloudflare project is configured as **Pages** instead of **Workers**, use the Pages build settings instead:
- Build command: `npm run build`
- Build output directory: `dist`
- Do not use `npx wrangler deploy` as a Pages build command.

## Suggested safest GitHub upload process from a phone
1. Open the existing `galumbra-supreme` repository.
2. Check whether `src` already exists. Do not delete the repository.
3. Upload the extracted files to the matching paths. If GitHub's mobile upload screen cannot create folders, create `src` by using **Add file → Create new file** and entering `src/main.jsx` as the filename/path, then paste the matching file contents. Repeat only for missing files. Do not paste the ZIP itself into the repo.
4. Ensure `wrangler.jsonc` and `package.json` are at the root.
5. Commit the changes.
6. Return to Cloudflare and open the latest deployment's build log.

## Before adding Supabase
The frontend can show a demo experience without Supabase being configured. To use real accounts and database operations:
1. Create a Supabase project.
2. Run `supabase/schema.sql` in Supabase Dashboard → SQL Editor after reviewing it.
3. Add `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` in the project's environment-variable settings.
4. Redeploy.

Never put a Supabase `service_role` key or any secret payment credential in a `VITE_` variable or frontend code.

## Honest feature status
This project is a starter foundation, not a finished million-user platform. A successful deployment only proves the website can be served; it does not prove every social, messaging, video, payment, AI, wallet, or trading feature is implemented and production-ready. Test each feature before inviting the public. Money services and trading require suitable licensed partners and regulatory review.
