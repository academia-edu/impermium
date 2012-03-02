module Impermium
  module User
    def account(user_id, enduser_ip, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :enduser_ip => enduser_ip
        )
      post("account", options, &block)
    end
    
    def account_attempt(enduser_ip, options={}, &block)
      options.merge!(
        :enduser_ip => enduser_ip
        )
      post("account/attempt", options, &block)
    end
    
    def account_login(user_id, enduser_ip, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :enduser_ip => enduser_ip
        )
      post("account/login", options, &block)
    end

    def analystfeedback(analyst_id, user_id, desired_result, options={}, &block)
      options.merge!(
        :analyst_id => analyst_id,
        :user_id => user_id,
        :desired_result => desired_result
        )
      post("user/account/analystfeedback", options, &block)
    end

    def userfeedback(rep_usr_id, rep_usr_type, reporter_ip, user_id, desired_result, options={}, &block)
      options.merge!(
        :reporter_user_id => rep_usr_id,
        :reporter_user_type => rep_usr_type,
        :reporter_ip => reporter_ip,
        :user_id => user_id,
        :desired_result => desired_result
        )
      post("user/account/userfeedback", options, &block)
    end
  end
end
