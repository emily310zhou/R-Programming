#Data
revenue_per_month <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses_per_month <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#Calculate profit as difference b/w revenue and expenses
profit_per_month <- revenue_per_month - expenses_per_month
profit_per_month

#Calculate profit after tax given tax rate = 30%
profit_after_tax <- round(0.7 * profit_per_month,2)
profit_after_tax

#Calculate profit margin after tax over revenue as &
profit_margin <- round(profit_after_tax / revenue_per_month,2) * 100
profit_margin

#Calculate average profit after tax for whole year
mean_profit_after_tax <- mean(profit_after_tax)
mean_profit_after_tax

#Find months w/ above mean profit after tax
good_months <- profit_after_tax > mean_profit_after_tax

#Find months w/ below mean profit after tax
bad_months <- profit_after_tax < mean_profit_after_tax
# or you could do this
# bad_months <- !good_months 

#Find highest profit month
best_month <- profit_after_tax == max(profit_after_tax)
best_month

#Find lowest profit month
worst_month <- profit_after_tax == min(profit_after_tax)
worst_month

#Units 
revenue_1000 <- round(revenue_per_month / 1000)
expenses_1000 <- round(expenses_per_month / 1000)
profit_1000 <- round(profit_per_month / 1000)
profit_after_tax_1000 <- round(profit_after_tax/ 1000)

