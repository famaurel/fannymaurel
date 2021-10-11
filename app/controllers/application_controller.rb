class ApplicationController < ActionController::Base

  before_action :redirect_subdomain
  before_action :set_locale

  def extract_locale
    parsed_locale = params[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/)[0]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def redirect_subdomain
    if request.host == 'www.fannymaurel.com'
      redirect_to 'https://fannymaurel.com' + request.fullpath, :status => 301
    end
  end

  def set_locale
    I18n.locale = extract_locale || :fr
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end

  def presentation
  end

  def contact
  end

  def avis
  end

  def home
  end

  def mentions
  end

  private
end
