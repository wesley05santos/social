module ApiLoginHelper
  def sign_in(user)
    user.authenticate!
    session = { section: user.section }
    allow_any_instance_of(Api::V1::ApplicationController).to receive(:session).and_return(session)
  end
end

