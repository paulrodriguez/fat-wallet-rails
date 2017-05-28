module UsersHelper
end

class UsersValidator < ActiveModel::Validator
  def validate(record)
    if record.email != "paul.d.rodriguez@outlook.com"
      record.errors[:base] << "You are not allowed to make an account"
    end
  end
end
