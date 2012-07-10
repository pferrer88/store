Spree::Order.class_eval do
 
        Spree::Order.state_machines[:state] = StateMachine::Machine.new(Spree::Order, :initial => 'cart') do
 
          # after_transition :to => 'complete', :do => :complete_order
          # before_transition :to => 'complete', :do => :process_payment
 
          event :next do
            transition :from => 'cart', :to => 'address'
            transition :from => 'address', :to => 'payment'
            transition :from => 'payment', :to => 'complete'
            transition :from => 'confirm', :to => 'complete'
          end
 
        end
        # 
        # def has_available_shipment
        #   true
        # end
 
      end


# module SpreeCustomExtension
#   class Engine < Rails::Engine
#     def self.activate
#       Spree::Order.class_eval do
# 
#         state_machine :initial => 'cart', :use_transactions => false do
# 
#           event :next do
#             transition :from => 'cart',     :to => 'address'
#             transition :from => 'address',  :to => 'confirm'
#             # transition :from => 'delivery', :to => 'payment', :if => :payment_required?
#             # transition :from => 'delivery', :to => 'complete'
#             transition :from => 'confirm',  :to => 'complete'
# 
#             # note: some payment methods will not support a confirm step
#             transition :from => 'payment',  :to => 'confirm',
#                                             :if => Proc.new { |order| order.payment_method && order.payment_method.payment_profiles_supported? }
# 
#             transition :from => 'payment', :to => 'complete'
#           end
# 
#           event :cancel do
#             transition :to => 'canceled', :if => :allow_cancel?
#           end
#           event :return do
#             transition :to => 'returned', :from => 'awaiting_return'
#           end
#           event :resume do
#             transition :to => 'resumed', :from => 'canceled', :if => :allow_resume?
#           end
#           event :authorize_return do
#             transition :to => 'awaiting_return'
#           end
# 
#           before_transition :to => 'complete' do |order|
#             begin
#               order.process_payments!
#             rescue Core::GatewayError
#               !!Spree::Config[:allow_checkout_on_gateway_error]
#             end
#           end
# 
#           #before_transition :to => 'delivery', :do => :remove_invalid_shipments!
# 
#           after_transition :to => 'complete', :do => :finalize!
#           #after_transition :to => 'delivery', :do => :create_tax_charge!
#           #after_transition :to => 'payment',  :do => :create_shipment!
#           after_transition :to => 'resumed',  :do => :after_resume
#           after_transition :to => 'canceled', :do => :after_cancel
# 
#         end
# 
#         def has_available_shipment
#           true
#         end
#       end
#     end
#   end
# end