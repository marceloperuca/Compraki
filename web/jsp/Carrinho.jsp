<%@page import="dao.FornecedorDAO"%>
<%@page import="classes.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrinho</title>
        <link rel="stylesheet" type="text/css" href="css/carrinho.css">  
    
        <link href="../Plugins/css/main.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-maskmoney/3.0.2/jquery.maskMoney.min.js"></script>

    </head>
    <body id="tudo" class="paginaCarrinho">

          <nav class="navbar navbar-expand-lg  border border-dar rounded shadow p-3 mb-5">
        <div class="logo">
            <h3 >Change Games</h3>
           
        </div>
       
    </nav>
        <div class="row" >
            <div class="col-xs-12 col-sm-1 col-md-1"></div>
            <div id="conteudoCarrinho" class="col-xs-12 col-sm-10 col-md-10">
                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Produto</td>
                                <td class="description">Descrição</td>
                                <td class="price">Preço</td>
                                <td class="quantity">Quantidade</td>
                                <td class="total">Total</td>
                                <td>Remover</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${carrinho}" var="item">
                                <tr>
                                    <td class="cart_product">
                                        <a href=""><img src="${item.produto.imagem}" alt="" width="100" height="80"></a>
                                    </td>
                                    <td class="cart_description">
                                        <h6>${item.produto.nome}</h6>
                                        <p>${item.produto.descricao}</p>
                                    </td>
                                    <td class="cart_price">
                                        <p>${item.produto.preco}</p>
                                    </td>
                                    <td class="cart_quantity">
                                        <form name="alteraQtedProd<c:out value="${item.produto.id}"/>" id="alteraQtedProd" method="post" action="../AlterarQuantidadeCarrinhoServlet">
                                            <div class="cart_quantity_button">
                                                <!--<a class="cart_quantity_up" href=""> + </a>-->
                                                <input class="cart_quantity_input" type="text" name="quantity" value="${item.quantidade}" autocomplete="off" size="2" onchange="javascript:submitQtdeCarrinho(alteraQtedProd<c:out value="${item.produto.id}"/>)">
                                                <!--<a class="cart_quantity_down" href=""> - </a>-->
                                                <input type="hidden" name="idProduto" value="${item.produto.id}"/>
                                            </div>
                                        </form>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">${item.total}</p>
                                    </td>
                                    <td class="cart_delete">
                                        <form id="removerProduto<c:out value="${item.produto.id}"/>" name="removerProduto" method="post" action="../RemoverProdutoCarrinhoServlet">
                                            <a class="cart_quantity_delete" href=""><i class="fa fa-times" onclick="javascript:removerItemCarrinho(removerProduto<c:out value="${item.produto.id}"/>)"></i></a>
                                            <input type="hidden" name="idProduto" value="${item.produto.id}"/>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                                <tr>
                                <td colspan="4">&nbsp;</td>
                                <td colspan="2">
                                    <table id="resumoValor"  class="table table-condensed total-result">
                                        <tr style="border-bottom: 1px solid #C2C2C1;">
                                            <td colspan="2">Resumo</td>
                                        </tr>
                                       
                                        <tr>
                                            <td>Valor Total</td>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <div class="row">      

            <div class="form-group col-xs-10 col-sm-9 col-md-9">
                <form method="post" action="../FinalizarPedidoServlet" name="finalizaCompraForm" id="finalizaCompraForm">
                    <button type="button" name="opcao" id="finalizar" class=" btn2 btn btn-success float-right" value="salvar">Finalizar</button>
                </form>
                <button type="button" name="opcao" id="paginaProdutos" class=" btn2 btn btn-cancel float-right " value="voltar">Voltar a comprar</button>
            </div> 
            <div class="form-group col-xs-2 col-sm-2 col-md-2">
            </div>  
        </div>
        <br><br><br><br><br><br>


       
        <script type="text/javascript">
            function submitQtdeCarrinho(formId) {
                $(formId).submit();
            }

            function removerItemCarrinho(formId){
                $(formId).submit();
            }

            $("#paginaProdutos").click(function () {
                $(location).attr("href", "PaginadeProdutos.jsp");
            });
            
            $("#finalizar").click(function(){
                $("#finalizaCompraForm").submit();
            });
        </script>
    </body>
</html>