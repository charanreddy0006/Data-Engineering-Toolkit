# ABAC

## Purpose
Attribute-Based Access Control evaluates attributes such as department, classification, purpose, environment, geography, or device context.

## Concept

`Allow if user.domain=fleet AND dataset.class=INTERNAL AND purpose=analytics`

## Tradeoff

ABAC is flexible but policy complexity requires testing, documentation, and governance.
