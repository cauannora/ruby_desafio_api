class CreateClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :email
      t.integer :cep
      t.string :logradouro
      t.string :bairro
      t.string :localidade
      t.string :uf

      t.timestamps
    end
  end
end
