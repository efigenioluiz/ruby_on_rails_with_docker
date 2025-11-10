class ProdutosController < ApplicationController

  def index
    @produtos = Produto.all

    # render json: { produtos: @produtos }
    render json: @produtos
  end


  def create
    puts "Criando um novo produto..."

    @produto = Produto.new(produto_params)


    if Produto.find_by(nome: @produto.nome)
      render json: { error: "Produto com esse nome já existe." }, status: :conflict
      return
    end


    if @produto.save!
      render json: @produto, status: :created
    else
      render json: @produto.errors, status: :unprocessable_entity
    end

  end


  private

  # def set_produto
  #   @produto = Produto.find(params[:id])
  # end

  def produto_params
    params.require(:produto).permit(:nome,:preco, :descricao, :quantidade)
  end

end
