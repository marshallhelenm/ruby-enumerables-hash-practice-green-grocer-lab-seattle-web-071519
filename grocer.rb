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
  cart.each do |coupon|
    if cart.keys.include? coupon[:item]
      if cart[coupon[:item][:count]] >= coupon[:num]
        name_w_coup = "#{coupon[:item]} W/COUPON"
        if !cart[name_w_coup]
          cart[name_w_coup] = {
            price: coupon[:cost]/coupon[:num],
            clearance: cart[coupon[:item]][:clearance],
            count: 
          }
        else 
        end 
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
