class QueixasController < ApplicationController
  before_action :set_queixa, only: [:show, :update, :destroy]
  
  # GET /queixas
  def index
    @queixas = Queixa.all

    render json: @queixas
  end

  # GET /queixas/1
  def show
    render json: @queixa
  end

  # POST /queixas
  def create
    @queixa = Queixa.new(queixa_params)

    @queixa.status_id = params[:status_id]
    @queixa.criado_por = params[:criado_por]

    # Find
    if params[:criado_por]
      @usuario = Usuario.find(params[:criado_por])
      # push to array
      @queixa.usuario_ids << @usuario.id
    end

    if @queixa.save
      render json: @queixa, status: :created, location: @queixa
    else
      render json: @queixa.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /queixas/1
  def update

    if @queixa.update(queixa_params)
      render json: @queixa
    else
      render json: @queixa.errors, status: :unprocessable_entity
    end
  end

  # DELETE /queixas/1
  def destroy
    @comentarios = Comentario.where(:queixa_id => params[:id])
    @comentarios.destroy

    @queixa.destroy
  end

  def find_by_criado_por
    @queixa = Queixa.where(:criado_por => params[:criado_por])
    render json: @queixa
  end

  def find_by_criado_por_status_id
    @queixa = Queixa.where(:criado_por => params[:criado_por]).where(:status_id => params[:status_id])
    render json: @queixa
  end

  def find_by_status_id
    @queixa = Queixa.where(:status_id => params[:status_id])
    render json: @queixa
  end

  def find_by_privacidade
    @queixa = Queixa.where(:privacidade => params[:privacidade])
    render json: @queixa
  end

  def find_by_tipo
    @queixa = Queixa.where(:tipo => params[:tipo])
    render json: @queixa
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_queixa
      @queixa = Queixa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def queixa_params
      params.require(:queixa).permit(:usuario_id, :usuarioid, :tipo, :gravidade, :titulo, :descricao, :privacidade, :status, :arquivos, :comentarios, :criado_por, :status_id)
    end
end
