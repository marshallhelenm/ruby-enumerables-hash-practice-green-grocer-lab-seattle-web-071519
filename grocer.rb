def consolidate_cart(cart)
  cons_cart = {}
  cart.each do |item|
    if cons_cart[item.keys[0]]
      cons_cart[item.keys[0]][:count] += 1
    else
      cons_cart[item.keys[0]] = {
        count: 1,
        price: item.values[0][:price],
        clearance: item.values[0][:clearance]
      }
    end   
  end
  cons_cart
end

def apply_coupons(cart, coupons)
  coup_cart = []
  cart.each do |coupon|
    if cart.keys.include? coupon[:item]
      if cart[coupon[:item]] >= coupon[:num]
        if 
      end 
    
    end
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
