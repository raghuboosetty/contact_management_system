class ApiErrorHandler < Grape::Middleware::Base
  def call!(env)
    @env = env
    begin
      @app.call(@env)
    rescue Exception => e
      if %w(production staging).include?(Rails.env) && e.class != RuntimeError
        #Place to write mailers. 
      end
      raise
    ensure
      ActiveRecord::Base.connection.close
    end
  end
end