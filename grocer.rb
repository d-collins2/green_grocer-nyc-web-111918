require "pry"
def consolidate_cart(cart)
  # code here
  consolidate = Hash.new 
  cart.each do |object_data|
   object_data.each do |name, data| 
    if consolidate[name] == nil 
      consolidate[name] = data.merge({:count => 1})
    else 
      consolidate[name][:count] += 1
    end 
   end 
  end 
  consolidate
end

def apply_coupons(cart, coupons)
  # code here
  new_cart = cart
  p coupons
  coupons.each do|coupons_hash| 
    item = coupons_hash[:item]
    if !new_cart[item] == nil && cart[item][:count] >= coupons_hash[:num]
      
      clearance = {"#{item} W/COUPON" => {
          :price => coupons_hash[:cost],
          :clearance => new_cart[item][:clearance],
          :count => 1
          }
        }
          if new_cart["#{item} W/COUPON"] == nil 
            new_cart.merge(clearance)
          else 
            new_cart["#{item} W/COUPON"][:count] += 1 
          end 
      new_cart[item][:count] -= coupons_hash[:num]
    end 
  end
  new_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
