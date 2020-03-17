require 'test_helper'

class ClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get clientes_url, as: :json
    assert_response :success
  end

  test "should create cliente" do
    assert_difference('Cliente.count') do
      post clientes_url, params: { cliente: { bairro: @cliente.bairro, cep: @cliente.cep, email: @cliente.email, localidade: @cliente.localidade, logradouro: @cliente.logradouro, nome: @cliente.nome, uf: @cliente.uf } }, as: :json
    end

    assert_response 201
  end

  test "should show cliente" do
    get cliente_url(@cliente), as: :json
    assert_response :success
  end

  test "should update cliente" do
    patch cliente_url(@cliente), params: { cliente: { bairro: @cliente.bairro, cep: @cliente.cep, email: @cliente.email, localidade: @cliente.localidade, logradouro: @cliente.logradouro, nome: @cliente.nome, uf: @cliente.uf } }, as: :json
    assert_response 200
  end

  test "should destroy cliente" do
    assert_difference('Cliente.count', -1) do
      delete cliente_url(@cliente), as: :json
    end

    assert_response 204
  end
end
