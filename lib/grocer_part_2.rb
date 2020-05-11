require_relative './part_1_solution.rb'
#require 'pry';

def apply_coupons(cart, coupons)
  new_cart = [];
  cart.map { |item_hash| 
    coupons.map { |coupon_hash| 
      if item_hash[:item] === coupon_hash[:item]
        og_hash = {};
        og_hash.replace(item_hash);
        coupon_item = {};
        coupon_item.replace(item_hash); 
        if item_hash[:count] > coupon_hash[:num]
          og_hash[:count] -= coupon_hash[:num];
          new_cart << og_hash; 
          coupon_item[:count] = coupon_hash[:num];
          coupon_item[:price] = coupon_hash[:cost]/coupon_hash[:num];
          coupon_item[:item] += " W/ COUPON";
          new_cart << coupon_item; 
        else 
          og_hash[:price] = coupon_hash[:cost]/coupon_hash[:num];
          og_hash[:item] += " W/ COUPON";
          new_cart << og_hash;
        end
      else 
        new_cart << item_hash; 
      end
    }
  }
  new_cart.uniq;
end

use_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1}
]

use_coupon = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00}
]

puts apply_coupons(use_cart, use_coupon);

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
