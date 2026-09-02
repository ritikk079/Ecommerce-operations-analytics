SELECT 
  CASE 
    WHEN julianday(o.order_delivered_customer_date) > julianday(o.order_estimated_delivery_date) THEN 'Late'
    ELSE 'On time or early'
  END AS delivery_status,
  COUNT(r.review_id) AS num_reviews,
  ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM olist_orders_dataset o
JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status;
