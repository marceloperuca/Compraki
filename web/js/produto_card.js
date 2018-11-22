$(document).ready(function () {
    
    const REST_URL = "http://localhost:8080/WSCompraki/controllers/produtos";
    
    $.ajax({
        type: "GET",
        url: REST_URL,
        success: function (data) {
            var resposta = "";
            for (i in data) {
                resposta += "<div class='card'>";
                resposta += "<img src=" +data[i].imagem+ " title= " + data[i].nome +">";
                resposta += "<h4>" + data[i].nome + "</h4>";
                resposta += "<p>" + data[i].descricao + "</p>";
                resposta += "<p class='price'>R$ " + data[i].valor + "</p>";
                resposta+="<p>Ou 10x de " + parseInt(data[i].valor) / 10 + " sem juros!</p>";
                resposta += "<p><button>Adicionar ao Carrinho</button></p>";
                resposta += "</div>";
            }
            resposta += "</div>";
            $(".container_cards").html(resposta);
        }
    });
});