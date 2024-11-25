view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  measure: test_liquid {
    type: number
    sql: ${rank} ;;
    html: {% if value < 2000 and count._value > 0 %}
        <p style="color: red; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
        {% else %}
        <p style="color: blue; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
        {% endif %};;

  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
