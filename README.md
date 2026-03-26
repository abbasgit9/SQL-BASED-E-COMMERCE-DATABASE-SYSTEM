# Ecommerce Database

A relational MySQL database for a basic e-commerce system covering customers, products, orders, payments, and order line items.

---

## Schema

| Table | Description |
|---|---|
| `customers` | Customer info: name, email, phone, address |
| `products` | Product catalog: name, category, price, stock |
| `orders` | Orders linked to customers with total amount |
| `order_items` | Line items per order: product, quantity, subtotal |
| `payments` | Payment method and status per order |

**Relationships:** `customers` → `orders` → `order_items` → `products`, and `orders` → `payments`

---

## Setup

**Requirements:** MySQL 5.7+

```bash
mysql -u root -p < ecommerce.sql
```

Or from within MySQL:

```sql
source ecommerce.sql;
```

---

## Sample Data

- 10 customers from Indian cities (Kolkata, Delhi, Mumbai, etc.)
- 10 products across Electronics, Accessories, and Storage
- 10 orders with matching payments (dated May 2025)
- Payment methods: Credit Card, Debit Card, UPI, Net Banking

---

## Included Queries

| Query | Purpose |
|---|---|
| Customer orders with product details | 5-table JOIN across all entities |
| Total orders per customer | `LEFT JOIN` + `GROUP BY` |
| Total sales amount | `SUM()` on `orders.total_amount` |
| Low stock products | `WHERE stock < 20` |
| Top 3 most expensive products | `ORDER BY price DESC LIMIT 3` |

---

## Files

- `ecommerce.sql` — Full database script (schema + data + queries)
- `ecommerc_ER.mwb` — MySQL Workbench ER diagram
