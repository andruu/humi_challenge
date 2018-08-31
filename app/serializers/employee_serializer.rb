class EmployeeSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :last_name,
             :dob,
             :marital_status,
             :sin,
             :hire_date,
             :preferences

  def sin
    "XXX XXX #{object.sin.last(3)}"
  end
end
