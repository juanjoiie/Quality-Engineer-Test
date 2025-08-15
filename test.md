# Data Model Relationship Diagram  
*Versions 1.1.0 to 1.3.0*  

```mermaid
%% MermaidJS Diagram (renders in Markdown-compatible tools)
flowchart TD
    %% ===== v1.1.0 =====
    subgraph v1_1_0["v1.1.0: First output_table ingestion"]
        outlets_info["outlets_info\n---\nPK: outlet_id\ncountry\nregion"]
        curr_exchange["curr_exchange\n---\nPK: country\nex_loc_to_eur"]
        sales_daily["sales_daily\n---\nPK: country+sales_date+outlet_id\nFK: outlet_id, product_id"]
        output_table["output_table\n---\nPK: country+sales_date+outlet_id\nFK: outlet_id"]

        outlets_info -->|1:N| sales_daily
        curr_exchange -->|1:N| sales_daily
        sales_daily -->|1:N| output_table
    end

    %% ===== v1.2.0 =====
    subgraph v1_2_0["v1.2.0: Add products_info"]
        products_info["products_info\n---\nPK: product_id\nis_own_brand"]
        products_info -->|1:N| sales_daily
    end

    %% ===== v1.3.0 =====
    subgraph v1_3_0["v1.3.0: Replace curr_exchange_v2"]
        curr_exchange_v2["curr_exchange_v2\n---\nPK: country+rate_date\nex_loc_to_eur"]
        curr_exchange_v2 -->|1:N| sales_daily
    end

    %% Styling
    classDef entity fill:#f9f9f9,stroke:#666,stroke-width:2px;
    classDef version fill:#e6f3ff,stroke:#0066cc,stroke-width:2px,stroke-dasharray:5;
    class outlets_info,curr_exchange,sales_daily,output_table,products_info,curr_exchange_v2 entity;
    class v1_1_0,v1_2_0,v1_3_0 version;
```

---

### **Key Entities**  
| Table               | Primary Key               | Foreign Key               |
|---------------------|---------------------------|---------------------------|
| `outlets_info`      | `outlet_id`               | -                         |
| `sales_daily`       | `country+sales_date+outlet_id` | `outlet_id`, `product_id` |
| `output_table`      | `country+sales_date+outlet_id` | `outlet_id`               |
| `products_info`     | `product_id`              | -                         |

### **Relationships**  
- **1:N**: `outlets_info` → `sales_daily`  
- **1:N**: `curr_exchange_v2` → `sales_daily` (v1.3.0+)  
- **1:N**: `products_info` → `sales_daily` (v1.2.0+)  
