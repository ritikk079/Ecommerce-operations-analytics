SELECT 
  payment_type,
  COUNT(*) AS num_payments,
  ROUND(AVG(payment_installments), 1) AS avg_installments,
  ROUND(AVG(payment_value), 2) AS avg_payment_value
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY num_payments DESC;
