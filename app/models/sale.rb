class Sale < ApplicationRecord
    
    def self.last_sales_x_month(months)
        Sale.where(created_at: months.months.ago..Date.today)
        .group("strftime('%m-%Y', created_at)")
        .order(created_at: :asc)    
    end
    
    def self.last_sales(months, column)
        Sale.where(created_at: months.months.ago..Date.today)
        .group(column)
        .count
    end


end
