# Docker — Source Databases

`docker-compose.yml` brings up MySQL + Postgres as the workshop's simulated
source systems. This runs **on the EC2 instance** (auto-started via
`../ec2-setup/user-data.sh`), not on your local laptop.

## Structure
```
docker/
├── docker-compose.yml
└── init/
    ├── mysql/      → init.sql goes here (auto-run on first container start)
    └── postgres/   → init.sql goes here (auto-run on first container start)
```

## TODO
- [ ] Finalize sample domain (e.g. e-commerce: customers/orders/products/transactions)
- [ ] Write `init/mysql/init.sql`
- [ ] Write `init/postgres/init.sql`
- [ ] Move passwords to `.env` (gitignored) instead of hardcoding
