# Galumbra Supreme — Web foundation

A responsive React/Vite web foundation for Android browsers and desktop. It includes a dark responsive interface, Supabase authentication wiring, shared text posts, and a configurable membership catalogue with 1,000 paid levels plus a free level.

## Important truth about this release

This is the **first buildable source-code foundation**, not a fully launched global social network yet. It is designed to become a real website after backend setup and deployment. It does not claim to provide working livestreaming, video hosting, private messaging, music production, AI inference, wallets, or payment processing yet. The interface labels these honestly. Do not accept payments until payment processing, terms, support, refund rules, and security have been completed.

## Membership price structure (Option B selected)

- Level 0: Free
- Paid levels 1–1,000: **₦1,300 × level number**
- Level 1,000: **Galumbra Apex — ₦1,300,000 equivalent**
- NGN is the canonical price; when a member selects another display currency, the interface converts the price using indicative exchange rates from a public FX feed.
- Exchange rates can change and are for display only. Confirm the actual charge currency and amount with a payment provider before taking payments.
- The catalogue is generated in the UI rather than storing a thousand repetitive cards in the database.
- The app currently creates a *plan request*, not a payment. Amounts are a proposed pricing structure, not a promise of income or benefits.

Potential name for the highest tier: **Galumbra Apex**. Other options: Galumbra Sovereign, Galumbra Infinity, Galumbra Supreme Black.

## 1. Create the backend

1. Open [Supabase](https://supabase.com) and create a project.
2. In the project, open **SQL Editor** and run `supabase/schema.sql`.
3. In **Project Settings → API**, copy the project URL and anon/public key.
4. Copy `.env.example` to `.env` and fill in the two values. Never put a Supabase service-role key in this frontend.
5. In Supabase **Authentication → Providers**, configure email/password. Set up an SMS provider before enabling phone OTP in production.
6. For local testing, install Node.js on a computer and run:

   ```bash
   npm install
   npm run dev
   ```

   Open the local address printed by Vite. To make a production build, run `npm run build`; the output is in `dist/`.

## 2. Publish the website

A practical beginner path is GitHub + Vercel or Netlify:
1. Create a GitHub repository and upload this folder.
2. Import the repository into Vercel or Netlify.
3. Add `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` as deployment environment variables.
4. Deploy and test on both Android and desktop.
5. Add your real domain after the website has been tested.

Hosting and backend providers can have free tiers, limits, or usage charges. Check current pricing before launch.

## 3. Before inviting real users

Must-have next modules:
- Storage buckets and upload policies for images/videos/audio
- Comments, reactions, follows, blocks, reports, moderation, and rate limits
- Private messaging using a conversation/message schema and realtime subscriptions
- Video processing, storage, content delivery, and creator analytics
- Real AI through a server/Edge Function; keep API secrets server-side
- Livestreaming provider and moderation
- Payment provider such as Paystack/Flutterwave, verified webhooks, transaction ledger, refunds, receipts, and admin approval
- Terms, privacy notice, community rules, age/safety controls, data deletion process, backups, monitoring, and abuse response
- A PWA manifest/service worker, then Android packaging (e.g. Trusted Web Activity or Capacitor) after the website is stable

A one-million-user service needs professional security review, capacity planning, monitoring, content delivery, and a realistic operating budget. Build and test in stages rather than promising that one file can do it all.

## Included today

- Responsive dark UI
- Email/password sign-up/sign-in wiring through Supabase
- Phone OTP request wiring (SMS provider setup required)
- Shared text post creation and feed retrieval after database configuration
- Membership catalogue (free + 1,000 paid levels)
- Plan request storage in NGN plus selected display currency (not payment processing)
- Clear status messaging for unfinished systems
