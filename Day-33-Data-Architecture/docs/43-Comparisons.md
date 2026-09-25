# 43. Architecture Comparisons

## Warehouse vs Lake vs Lakehouse

| Area | Warehouse | Data Lake | Lakehouse |
|---|---|---|---|
| Main focus | Analytics | Flexible storage | Lake + analytics |
| Raw data | Possible | Strong | Strong |
| BI | Strong | Possible | Strong |
| Schema | Usually controlled | Flexible | Managed table layer |
| Multi-workload | Depends | Strong | Strong |

## Lambda vs Kappa
Lambda uses batch + speed paths.
Kappa emphasizes a streaming/replay path.

## Mesh vs Centralized
Mesh emphasizes domain ownership and data products. Centralized architecture concentrates platform ownership.

## Fabric vs Mesh
Fabric emphasizes integration, metadata and governance. Mesh emphasizes domain ownership and data-as-a-product. They can coexist.
