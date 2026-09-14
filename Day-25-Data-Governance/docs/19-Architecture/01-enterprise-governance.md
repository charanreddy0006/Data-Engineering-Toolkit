# Enterprise Data Governance Architecture

## Purpose
Connect people, policy, metadata, controls, and platforms.

## Architecture

```text
                         GOVERNANCE COUNCIL
                                |
                    Policies / Standards / Decisions
                                |
                +---------------+---------------+
                |                               |
        Governance Platform              Domain Governance
                |                               |
      +---------+---------+                 Owners/Stewards
      |         |         |
   Catalog   Lineage   Classification
      |         |         |
      +---------+---------+
                |
       Data Platforms / APIs
                |
        +-------+--------+
        |                |
     Lakehouse         Warehouse
        |                |
        +-------+--------+
                |
           Data Products
                |
       Analytics / AI / Apps
