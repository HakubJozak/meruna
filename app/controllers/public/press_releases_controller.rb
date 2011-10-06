class Public::PressReleasesController < Public::BaseController

  def index
    @releases = PressRelease.recent
  end

  def show
    @press_release = PressRelease.find(params[:id])
  end

end
