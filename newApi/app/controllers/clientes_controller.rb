class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :update, :destroy]

  # GET /clientes
  def index
    @clientes = Cliente.all

    render json: @clientes
  end

  # GET /clientes/1
  def show
    render json: @cliente
  end

  # POST /clientes
  def create
    @cliente = Cliente.new(cliente_params)
    cep = @cliente.cep
    reponse_json = JSON.parse(Net::HTTP.get_response('viacep.com.br',"/ws/#{cep}/json").body)
    @cliente.logradouro = reponse_json["logradouro"]
    @cliente.bairro = reponse_json["bairro"]
    @cliente.localidade = reponse_json["localidade"]
    @cliente.uf = reponse_json["uf"]
    if @cliente.save
      render json: @cliente, status: :created, location: @cliente
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clientes/1
  def update
    if @cliente.update(cliente_params)
      render json: @cliente
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clientes/1
  def destroy
    @cliente.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cliente_params
      params.require(:cliente).permit(:nome, :email, :cep, :logradouro, :bairro, :localidade, :uf)
    end
  def cliente_params_api
    params.require(:cliente).permit(:nome, :email, :cep)
  end
end
