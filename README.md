# DriverLedger

Cross-platform business tracker for rideshare and delivery drivers.

## MVP foundation
- Dashboard with income, expenses, profit and mileage
- Income and expense ledger
- Business mileage
- Driver inventory
- Free/Pro subscription paywall
- Supabase schema with row-level security
- RevenueCat dependency ready for App Store / Google Play subscriptions

## Planned Pro pricing
- Monthly: CAD $9.99
- Annual: CAD $79.99

## Run locally
1. Install Flutter.
2. Run `flutter pub get`.
3. Run `flutter run`.

The current UI uses demo data so it runs before backend credentials are configured.

## Backend
Create a Supabase project and run `supabase/schema.sql`. Never commit Supabase service-role keys or RevenueCat secret keys.

## Next milestones
1. Supabase authentication and environment configuration
2. CRUD forms for transactions, mileage and inventory
3. Receipt image upload
4. RevenueCat entitlement service and native store products
5. Reports/export
6. Automated tests and CI
