<!DOCTYPE html>
<html lang="en">
</head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <title>Forma de pagamento</title>

</head>

<body>
<?php
// ---------------- Ação ---------------- //

    $nome = isset($_POST['nome']) ? htmlspecialchars($_POST['nome']) : '';
    $valorcompra = isset($_POST['valorcompra']) ? htmlspecialchars($_POST['valorcompra']) : '';
    $forma = isset($_POST['forma']) ? htmlspecialchars($_POST['forma']) : '';
    $desconto = isset($_POST['desconto']) ? htmlspecialchars($_POST['desconto']) : '';
    $valorpagar = 0;
    $economia=0;

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
       
        $valorcompra = isset($_POST['valorcompra']) ? floatval($_POST['valorcompra']) : 0;
        $porcentagem = 0.10; // 10% em decimal
        $economia = $valorcompra * $porcentagem;
        $valorpagar = $valorcompra - $economia;
    }
    ?>

<div class="w3-container w3-teal">
    <h2 class="w3-text-white">PROMOÇÃO DO MÊS DE ANIVERSÁRIO!</h2>

    <?php
    echo "" . $nome . "!<br>";
    echo "Valor da Compra Sem Desconto: R$" . $valorcompra. "<br>";
    echo "Forma de Pagamento escolhida: " . $forma. "<br>";
    echo "Desconto de: 10% " . $desconto. "<br>";

    echo "Você economizou: R$" . number_format($economia, 2, ',', '.') . "<br>";
    echo "Valor à pagar: R$" . number_format($valorpagar, 2, ',', '.') . "<br>";
    ?>
<br>
</div>
    
</body>
</html>