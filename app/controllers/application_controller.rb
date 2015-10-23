class ApplicationController < ActionController::API
  before_action :allow_cross_origin_requests, if: proc { Rails.env.development? }

  def preflight
    render nothing: true
  end

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  expose(:during_promotion_period?) { Time.current >= Rails.application.config.promotion_start && Time.current <= Rails.application.config.promotion_end }
  expose(:before_promotion_period?) { Time.current < Rails.application.config.promotion_start }
  expose(:after_promotion_period?)  { Time.current > Rails.application.config.promotion_end }

  expose(:user_agent) { UserAgent.parse(request.user_agent) }
private

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || admin_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end

  def allow_cross_origin_requests
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Max-Age'] = '1728000'
  end
end
