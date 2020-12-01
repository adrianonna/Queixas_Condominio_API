class QueixasController < ApplicationController
  before_action :set_queixa, only: [:show, :update, :destroy]

  # GET /queixas
  def index
    tokenUser = @_request.headers["X-Usuario-Token"]
    user = Usuario.where(:authentication_token => tokenUser)

    if user[0].perfil_id === "5fa1b6b64debe72ed41388ac"
      @queixas = Queixa.all
      render json: @queixas
    else
      @queixas = Queixa.where(:privacidade => false)
      render json: @queixas
    end
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
    tokenUser = @_request.headers["X-Usuario-Token"]
    user = Usuario.where(:authentication_token => tokenUser)

    if user[0].perfil_id === "5fa1b6b64debe72ed41388ac" #Se quem estiver excluindo for admin
      @comentarios = Comentario.where(:queixa_id => params[:id]) #Pega todos os comentários daquela queixa
      @comentarios.destroy
      @queixa.destroy
    elsif user[0]._id === @queixa.criado_por #Se quem estiver excluindo for o dono da queixa
      @queixa.status_id = "5fbd58d23ca5732d6c6370ac" #Altera o estado da queixa para pendende para exclusão
      @queixa.update
      render json: {
        messages: "Status changed - pending for exclusion",
        is_success: false,
        data: {}
      }, status: :unauthorized
    else
      render json: {
        messages: "You don't have necessary authorization",
        is_success: false,
        data: {}
      }, status: :unauthorized
    end

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
