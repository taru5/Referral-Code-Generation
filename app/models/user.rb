class User < ActiveRecord::Base

validate :assign_referral_code, on: :create
validates :referral_code, uniqueness: true, on: :create
validates :name, presence: true

def numpart
	num = rand(0..999).to_s
	num ='00'+num if num.size==1;
	num ='0'+num if num.size==2;
	return num;
end

def assign_referral_code
	str = self.name.slice(0,3).upcase
	ref = str + numpart
	while User.lock(true).find_by(referral_code: ref)!=nil
		ref = str + numpart
	end
	self.referral_code = ref;
end

end
