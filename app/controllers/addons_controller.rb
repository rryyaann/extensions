class AddonsController < ApplicationController
  before_action :set_addon, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @addons = Addon.all
  end

  def show
  end

  def new
    @addon = current_user.addons.build
  end

  def edit
  end

  def create
    @addon = current_user.addons.build(addon_params)
    if @addon.save
      redirect_to @addon, notice: 'Addon was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @addon.update(addon_params)
      redirect_to @addon, notice: 'Addon was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @addon.destroy
    redirect_to addons_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addon
      @addon = Addon.find(params[:id])
    end

    def correct_user
      @addon = current_user.addons.find_by(id: params[:id])
      redirect_to addons_path, notice: "Not authorized to edit this addon" if @addon.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def addon_params
      params.require(:addon).permit(:description, :explanation, :category, :url)
    end
end