module Student::AngularHelper

  def snakefy_symbolize_keys(jsonable)
    case jsonable
    when Array
      jsonable.map{ |child| snakefy_symbolize_keys(child) }
    when Hash
      hash = {}
      jsonable.each do |key, value|
        hash[key.to_s.underscore.to_sym] = snakefy_symbolize_keys(value)
      end
      hash
    else
      jsonable
    end
  end

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

  def with_render_exception
    begin
      yield
    rescue Exception => e
      # AdminMailer.error_notification(params, "with_render_exception error").deliver
      logger.fatal e.message
      render :json => { :success => false, :message => e.message }, :status => 422
    end
  end

  def render_success
    render :json => { :success => true }
  end
end
