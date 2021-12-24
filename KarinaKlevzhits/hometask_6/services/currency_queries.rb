# frozen_string_literal: true

# module currency_queries
module CurrencyQueries
  def top_by_currency(currency, limit)
    "SELECT ABS(c1.rate-c2.rate) as difference
        from currencies as c1
        join currencies as c2
        on c1.time-c2.time=1
        where c1.currency = c2.currency and c1.currency='#{currency}'
        order by difference desc limit #{limit}"
  end
end
