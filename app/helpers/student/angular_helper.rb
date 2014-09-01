module Student::AngularHelper
  def camelize_symbolize_keys(jsonable)
    case jsonable
    when Array
      jsonable.map{ |child| camelize_symbolize_keys(child) }
    when Hash
      hash = {}
      jsonable.each do |key, value|
        hash[key.to_s.camelize(:lower).to_sym] = camelize_symbolize_keys(value)
      end
      hash
    else
      jsonable
    end
  end
end
