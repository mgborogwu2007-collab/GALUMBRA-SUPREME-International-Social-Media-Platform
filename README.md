# GALUMBRA SUPREME

A dark, mobile-first social platform starter built with React, Vite, Lucide icons, and optional Supabase integration.

## Product direction
Galumbra Supreme aims to bring together a social feed, short and long video, creator tools, private and group messaging, public channels, business/brand tools, and creator monetization under one brand. The long-term plan is intentionally phased so core social functions can be tested before financial services or high-scale features are added.

## Tech stack
- React 18
- Vite 6
- Lucide React icons
- Supabase JavaScript client
- Cloudflare Workers static assets (configured in `wrangler.jsonc`)

## Quick start (developer computer)
Requires a supported Node.js version and internet access to install packages.

```bash
npm install
npm run dev
```

Create a production build:

```bash
npm run build
```

Deploy with Cloudflare Wrangler:

```bash
npm run deploy
```

## Repository layout
```text
.
├── index.html
├── package.json
├── wrangler.jsonc
├── src/
│   ├── main.jsx
│   ├── App.jsx
│   ├── style.css
│   └── supabase.js
└── supabase/
    └── schema.sql
```

## Supabase setup
1. Create a Supabase project.
2. Open SQL Editor and review/run `supabase/schema.sql`.
3. Set `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` in the build/deployment environment.
4. Redeploy and test authentication and database actions.

Only use the public anon/publishable key in the frontend, protected by correct Row Level Security policies. Never expose service-role keys.

## Cloudflare Worker settings
- Build command: `npm run build`
- Deploy command: `npx wrangler deploy`
- Root directory: `/`
- `wrangler.jsonc` serves the generated `dist` folder and routes unknown paths to the SPA entry page.

If you are deploying using **Cloudflare Pages** rather than Workers, set the output directory to `dist` and use the Pages build configuration. Do not mix the Workers deploy command with Pages settings.

## Security and production checklist
- [ ] Confirm all environment variables are configured in the hosting dashboard.
- [ ] Review RLS policies and test using two different accounts.
- [ ] Add rate limits, abuse reporting, moderation workflow, and account recovery.
- [ ] Validate and limit uploads; use private storage buckets where appropriate.
- [ ] Add privacy policy, terms, community guidelines, and data deletion workflow.
- [ ] Add monitoring and backups before real users depend on the service.
- [ ] Use a licensed payment provider for money movement; seek regulatory/legal advice before wallets, forex, or crypto.
- [ ] Load-test before promising support for large user numbers.

## Current scope
This is a starter application and deployment foundation. It is not yet a complete production social network. Features such as large-scale video hosting/transcoding, real-time chat, livestreaming, monetization payouts, ad marketplace, wallet, forex/crypto, and AI tools need dedicated implementation, testing, infrastructure, and compliance work.
