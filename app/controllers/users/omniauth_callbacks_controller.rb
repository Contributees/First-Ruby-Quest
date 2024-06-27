module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
      @user = User.from_omniauth(auth)

      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Github'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.github_data'] = auth.except('extra') # Removing extra as it can overflow some session stores
        redirect_to root_path, alert: @user.errors.full_messages.join("\n")
      end
    end

    def failure
      redirect_to root_path, alert: "Something went wrong. Please try again."
    end

    private

    def auth
      request.env['omniauth.auth']
    end
  end
end
