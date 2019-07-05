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
  coupons.each do |coupon|
    if cart.keys.include? coupon[:item]
      if cart[coupon[:item]][:count] >= coupon[:num]
        name_w_coup = "#{coupon[:item]} W/COUPON"
        if cart[name_w_coup]
          cart[name_w_coup][:count] += coupon[:num]
        else 
          cart[name_w_coup] = {
            count: coupon[:num],
            price: coupon[:cost]/coupon[:num],
            clearance: cart[coupon[:item]][:clearance]
          } 
        end 
        cart[coupon[:item]][:count] -= coupon[:num]
      end 
    end
  end
  cart
end

def apply_clearance(cart)
  cart.keys.each do |item|
    if cart[item][:clearance]
      cart[item][:price] = (cart[item][:price] * 0.80).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  new_cart = consolidate_cart(cart)
  new_cart = apply_coupons(new_cart)
  new_cart = apply_clearance(new_cart)
  new_cart
end
