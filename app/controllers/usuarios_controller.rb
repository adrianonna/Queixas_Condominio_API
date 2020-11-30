class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /usuarios
  def index
    @usuarios = Usuario.all

    render json: @usuarios
  end

  # GET /usuarios/1
  def show
    render json: @usuario
  end

  # POST /usuarios
  # def create
  #   @usuario = Usuario.new(usuario_params)

  #   @usuario.perfil_id = params[:perfil_id]

  #   if @usuario.save
  #     render json: @usuario, status: :created, location: @usuario
  #   else
  #     render json: @usuario.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /usuarios/1
  def update
    if @usuario.update(usuario_params)
      render json: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usuarios/1
  def destroy
    tokenUser = @_request.headers["X-Usuario-Token"]
    user = Usuario.where(:authentication_token => tokenUser)
    @queixas = Queixa.where(:criado_por => params[:id])
    @passou = true

    if user[0].perfil_id === "5fa1b6b64debe72ed41388ac" #Verifica se o usuário for admin
      for queixa in @queixas.each #Para cada queixa do usuário
        if queixa.status_id.to_s != "5fa1ba423ca57304b0fe6f8e" #Verifica se tem alguma queixa que não está fechada
          @passou = false
        end
      end

      if @passou == true
        for queixa in @queixas.each #Para cada queixa do usuário
          for comentario in Comentario.each #Para cada comentário
            if queixa.id === comentario.queixa_id #Verifica se o comentário faz parte de cada queixa em questão
              @comentario = Comentario.where(:queixa_id => queixa.id) #Salva o comentario para poder dar o destroy
              @comentario.destroy
            end
          end
        end
        @queixas.destroy
        @usuario.destroy
      else
        render json: {
            messages: "You have unfinished reports",
            is_success: false,
            data: {}
        }, status: :unauthorized
      end
    else
      render json: {
          messages: "You don't have necessary authorization",
          is_success: false,
          data: {}
      }, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def usuario_params
      params.require(:usuario).permit(:nome, :email, :senha, :endereco, :denuncias, :perfil_id)
    end
end
