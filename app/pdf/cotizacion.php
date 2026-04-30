<?php

$peticion_ajax = true;
$code = (isset($_GET['code'])) ? $_GET['code'] : 0;

/*---------- Incluyendo configuraciones ----------*/
require_once "../../config/app.php";
require_once "../../autoload.php";

/*---------- Instancia al controlador venta ----------*/

use app\controllers\quotationController;

$ins_cotizacion = new quotationController();

$datos_cotizacion = $ins_cotizacion->seleccionarDatos(
    "Normal",
    "cotizacion 
    INNER JOIN cliente ON cotizacion.cliente_id = cliente.cliente_id 
    INNER JOIN usuario ON cotizacion.usuario_id = usuario.usuario_id
    WHERE (cotizacion_codigo='$code')",
    "*",
    0
);

if ($datos_cotizacion->rowCount() == 1) {

    /*---------- Datos de la venta ----------*/
    $datos_cotizacion = $datos_cotizacion->fetch();

    /*---------- Seleccion de datos de la empresa ----------*/
    $datos_empresa = $ins_cotizacion->seleccionarDatos("Normal", "empresa LIMIT 1", "*", 0);
    $datos_empresa = $datos_empresa->fetch();


    require "./code128.php";

    $pdf = new PDF_Code128('P', 'mm', 'Letter');
    $pdf->SetMargins(17, 17, 17);
    $pdf->AddPage();
    $pdf->Image(APP_URL . 'app/views/img/logo.jpeg', 165, 12, 35, 35, 'jpeg');

    $pdf->SetFont('Arial', 'B', 16);
    $pdf->SetTextColor(32, 100, 210);
    $pdf->Cell(150, 10, iconv("UTF-8", "ISO-8859-1", strtoupper($datos_empresa['empresa_nombre'])), 0, 0, 'L');

    $pdf->Ln(9);

    $pdf->SetFont('Arial', '', 10);
    $pdf->SetTextColor(39, 39, 51);
    $pdf->Cell(150, 9, iconv("UTF-8", "ISO-8859-1", ""), 0, 0, 'L');

    $pdf->Ln(5);

    $pdf->Cell(150, 9, iconv("UTF-8", "ISO-8859-1", $datos_empresa['empresa_direccion']), 0, 0, 'L');

    $pdf->Ln(5);

    $pdf->Cell(150, 9, iconv("UTF-8", "ISO-8859-1", "Teléfono: " . $datos_empresa['empresa_telefono']), 0, 0, 'L');

    $pdf->Ln(5);

    $pdf->Cell(150, 9, iconv("UTF-8", "ISO-8859-1", "Email: " . $datos_empresa['empresa_email']), 0, 0, 'L');

    $pdf->Ln(10);

    $pdf->SetFont('Arial', '', 10);
    $pdf->Cell(30, 7, iconv("UTF-8", "ISO-8859-1", 'Fecha de emisión:'), 0, 0);
    $pdf->SetTextColor(97, 97, 97);
    $pdf->Cell(116, 7, iconv("UTF-8", "ISO-8859-1", date("d/m/Y", strtotime($datos_cotizacion['cotizacion_fecha'])) . " " . $datos_cotizacion['cotizacion_hora']), 0, 0, 'L');
    $pdf->SetFont('Arial', 'B', 10);
    $pdf->SetTextColor(39, 39, 51);
    $pdf->Cell(35, 7, iconv("UTF-8", "ISO-8859-1", strtoupper('Cotizacion Nro.')), 0, 0, 'C');

    $pdf->Ln(7);

    $pdf->SetFont('Arial', '', 10);
    $pdf->Cell(12, 7, iconv("UTF-8", "ISO-8859-1", 'Cajero:'), 0, 0, 'L');
    $pdf->SetTextColor(97, 97, 97);
    $pdf->Cell(134, 7, iconv("UTF-8", "ISO-8859-1", $datos_cotizacion['usuario_nombre'] . " " . $datos_cotizacion['usuario_apellido']), 0, 0, 'L');
    $pdf->SetFont('Arial', 'B', 10);
    $pdf->SetTextColor(97, 97, 97);
    $pdf->Cell(35, 7, iconv("UTF-8", "ISO-8859-1", strtoupper($datos_cotizacion['cotizacion_id'])), 0, 0, 'C');

    $pdf->Ln(10);

    if ($datos_cotizacion['cliente_id'] == 1) {
        $pdf->SetFont('Arial', '', 10);
        $pdf->SetTextColor(39, 39, 51);
        $pdf->Cell(13, 7, iconv("UTF-8", "ISO-8859-1", 'Cliente:'), 0, 0);
        $pdf->SetTextColor(97, 97, 97);
        $pdf->Cell(60, 7, iconv("UTF-8", "ISO-8859-1", "N/A"), 0, 0, 'L');
        $pdf->SetTextColor(39, 39, 51);
        $pdf->Cell(8, 7, iconv("UTF-8", "ISO-8859-1", "Doc: "), 0, 0, 'L');
        $pdf->SetTextColor(97, 97, 97);
        $pdf->Cell(60, 7, iconv("UTF-8", "ISO-8859-1", "N/A"), 0, 0, 'L');
        $pdf->SetTextColor(39, 39, 51);
        $pdf->Cell(7, 7, iconv("UTF-8", "ISO-8859-1", 'Tel:'), 0, 0, 'L');
        $pdf->SetTextColor(97, 97, 97);
        $pdf->Cell(35, 7, iconv("UTF-8", "ISO-8859-1", "N/A"), 0, 0);
        $pdf->SetTextColor(39, 39, 51);

        $pdf->Ln(7);

        $pdf->SetTextColor(39, 39, 51);
        $pdf->Cell(6, 7, iconv("UTF-8", "ISO-8859-1", 'Dir:'), 0, 0);
        $pdf->SetTextColor(97, 97, 97);
        $pdf->Cell(109, 7, iconv("UTF-8", "ISO-8859-1", "N/A"), 0, 0);
    } else {
        $pdf->SetFont('Arial', '', 10);
        $pdf->SetTextColor(39, 39, 51);
        $pdf->Cell(13, 7, iconv("UTF-8", "ISO-8859-1", 'Cliente:'), 0, 0);
        $pdf->SetTextColor(97, 97, 97);
        $pdf->Cell(60, 7, iconv("UTF-8", "ISO-8859-1", $datos_cotizacion['cliente_nombre'] . " " . $datos_cotizacion['cliente_apellido']), 0, 0, 'L');
        $pdf->SetTextColor(39, 39, 51);
        $pdf->Cell(8, 7, iconv("UTF-8", "ISO-8859-1", "Doc: "), 0, 0, 'L');
        $pdf->SetTextColor(97, 97, 97);
        $pdf->Cell(60, 7, iconv("UTF-8", "ISO-8859-1", $datos_cotizacion['cliente_tipo_documento'] . " " . $datos_cotizacion['cliente_numero_documento']), 0, 0, 'L');
        $pdf->SetTextColor(39, 39, 51);
        $pdf->Cell(7, 7, iconv("UTF-8", "ISO-8859-1", 'Tel:'), 0, 0, 'L');
        $pdf->SetTextColor(97, 97, 97);
        $pdf->Cell(35, 7, iconv("UTF-8", "ISO-8859-1", $datos_cotizacion['cliente_telefono']), 0, 0);
        $pdf->SetTextColor(39, 39, 51);

        $pdf->Ln(7);

        $pdf->SetTextColor(39, 39, 51);
        $pdf->Cell(6, 7, iconv("UTF-8", "ISO-8859-1", 'Dir:'), 0, 0);
        $pdf->SetTextColor(97, 97, 97);
        $pdf->Cell(109, 7, iconv("UTF-8", "ISO-8859-1", $datos_cotizacion['cliente_provincia'] . ", " . $datos_cotizacion['cliente_ciudad'] . ", " . $datos_cotizacion['cliente_direccion']), 0, 0);
    }

    $pdf->Ln(9);

    $pdf->SetFillColor(23, 83, 201);
    $pdf->SetDrawColor(23, 83, 201);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->Cell(100, 8, iconv("UTF-8", "ISO-8859-1", 'Descripción'), 1, 0, 'C', true);
    $pdf->Cell(15, 8, iconv("UTF-8", "ISO-8859-1", 'Cant.'), 1, 0, 'C', true);
    $pdf->Cell(32, 8, iconv("UTF-8", "ISO-8859-1", 'Precio'), 1, 0, 'C', true);
    $pdf->Cell(34, 8, iconv("UTF-8", "ISO-8859-1", 'Subtotal'), 1, 0, 'C', true);

    $pdf->Ln(8);

    $pdf->SetFont('Arial', '', 9);
    $pdf->SetTextColor(39, 39, 51);

    /*----------  Seleccionando detalles de la venta  ----------*/
    $cotizacion_detalle = $ins_cotizacion->seleccionarDatos("Normal", "cotizacion_detalle WHERE cotizacion_codigo='" . $datos_cotizacion['cotizacion_codigo'] . "'", "*", 0);
    $cotizacion_detalle = $cotizacion_detalle->fetchAll();

    foreach ($cotizacion_detalle as $detalle) {

        $x = $pdf->GetX();
        $y = $pdf->GetY();

        // Descripción (con salto automático)
        $pdf->MultiCell(
            100,
            7,
            iconv(
                "UTF-8",
                "ISO-8859-1",
                $detalle['cotizacion_detalle_descripcion']
            ),
            1,
            'L'
        );

        // Guardamos nueva Y después del MultiCell
        $y2 = $pdf->GetY();

        // Posicionamos para las otras celdas
        $pdf->SetXY($x + 100, $y);

        $pdf->Cell(
            15,
            $y2 - $y,
            iconv("UTF-8", "ISO-8859-1", $detalle['cotizacion_detalle_cantidad']),
            1,
            0,
            'C'
        );

        $pdf->Cell(
            32,
            $y2 - $y,
            iconv(
                "UTF-8",
                "ISO-8859-1",
                MONEDA_SIMBOLO . number_format(
                    $detalle['cotizacion_detalle_precio_venta'],
                    MONEDA_DECIMALES,
                    MONEDA_SEPARADOR_DECIMAL,
                    MONEDA_SEPARADOR_MILLAR
                )
            ),
            1,
            0,
            'C'
        );

        $pdf->Cell(
            34,
            $y2 - $y,
            iconv(
                "UTF-8",
                "ISO-8859-1",
                MONEDA_SIMBOLO . number_format(
                    $detalle['cotizacion_detalle_total'],
                    MONEDA_DECIMALES,
                    MONEDA_SEPARADOR_DECIMAL,
                    MONEDA_SEPARADOR_MILLAR
                )
            ),
            1,
            0,
            'C'
        );

        $pdf->Ln();
    }

    $pdf->SetFont('Arial', 'B', 9);
    $pdf->Cell(100, 7, iconv("UTF-8", "ISO-8859-1", ''), 'T', 0, 'C');
    $pdf->Cell(15, 7, iconv("UTF-8", "ISO-8859-1", ''), 'T', 0, 'C');

    //$pdf->Cell(32, 7, iconv("UTF-8", "ISO-8859-1", 'TOTAL COTIZADO'), 'T', 0, 'C');
    //$pdf->Cell(34, 7, iconv("UTF-8", "ISO-8859-1", MONEDA_SIMBOLO . number_format($datos_cotizacion['cotizacion_total'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . ' ' . MONEDA_NOMBRE), 'T', 0, 'C');


    $total = $datos_cotizacion['cotizacion_total']; // ya incluye IVA
    $subtotal = $total / 1.13;
    $iva = $total - $subtotal;

    $pdf->Ln(5);

    /* SUBTOTAL */
    $pdf->Cell(115, 7, '', 0, 0, 'C');
    $pdf->Cell(32, 7, 'SUBTOTAL', 0, 0, 'C');
    $pdf->Cell(34, 7, MONEDA_SIMBOLO . number_format($subtotal, MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR), 0, 0, 'C');

    $pdf->Ln(7);

    /* IVA */
    $pdf->Cell(100, 7, '', 0, 0, 'C');
    $pdf->Cell(15, 7, '', 0, 0, 'C');
    $pdf->Cell(32, 7, 'IVA (13%)', 0, 0, 'C');
    $pdf->Cell(34, 7, MONEDA_SIMBOLO . number_format($iva, MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR), 0, 0, 'C');

    $pdf->Ln(7);

    /* TOTAL */
    $pdf->Cell(100, 7, '', 0, 0, 'C');
    $pdf->Cell(15, 7, '', 0, 0, 'C');
    $pdf->Cell(32, 7, 'TOTAL COTIZADO', 0, 0, 'C');
    $pdf->Cell(34, 7, MONEDA_SIMBOLO . number_format($total, MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . ' ' . MONEDA_NOMBRE, 0, 0, 'C');

    //$pdf->Ln(7);

    //$pdf->Cell(100, 7, iconv("UTF-8", "ISO-8859-1", ''), '', 0, 'C');
    //$pdf->Cell(15, 7, iconv("UTF-8", "ISO-8859-1", ''), '', 0, 'C');
    //$pdf->Cell(32, 7, iconv("UTF-8", "ISO-8859-1", 'TOTAL PAGADO'), '', 0, 'C');
    //$pdf->Cell(34, 7, iconv("UTF-8", "ISO-8859-1", MONEDA_SIMBOLO . number_format($datos_cotizacion['venta_pagado'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . ' ' . MONEDA_NOMBRE), '', 0, 'C');

    //$pdf->Ln(7);

    //$pdf->Cell(100, 7, iconv("UTF-8", "ISO-8859-1", ''), '', 0, 'C');
    //$pdf->Cell(15, 7, iconv("UTF-8", "ISO-8859-1", ''), '', 0, 'C');
    //$pdf->Cell(32, 7, iconv("UTF-8", "ISO-8859-1", 'CAMBIO'), '', 0, 'C');
    //$pdf->Cell(34, 7, iconv("UTF-8", "ISO-8859-1", MONEDA_SIMBOLO . number_format($datos_cotizacion['venta_cambio'], MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . ' ' . MONEDA_NOMBRE), '', 0, 'C');

    $pdf->Ln(12);

    $pdf->SetFont('Arial', '', 9);

    $pdf->SetTextColor(39, 39, 51);
    $pdf->MultiCell(0, 9, iconv("UTF-8", "ISO-8859-1", "*** Gracias por su interés en nuestros productos ***"), 0, 'C', false);
    $pdf->MultiCell(0, 1, iconv("UTF-8", "ISO-8859-1", "*** Esta cotización tiene una validez de 7 días ***"), 0, 'C', false);

    $pdf->Ln(9);

    $pdf->SetFillColor(39, 39, 51);
    $pdf->SetDrawColor(23, 83, 201);
    $pdf->Code128(72, $pdf->GetY(), $datos_cotizacion['cotizacion_codigo'], 70, 20);
    $pdf->SetXY(12, $pdf->GetY() + 21);
    $pdf->SetFont('Arial', '', 12);
    $pdf->MultiCell(0, 5, iconv("UTF-8", "ISO-8859-1", $datos_cotizacion['cotizacion_codigo']), 0, 'C', false);

    $pdf->Output("I", "Cotizacion_Nro" . $datos_cotizacion['cotizacion_id'] . ".pdf", true);
} else {
?>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title><?php echo APP_NAME; ?></title>
        <?php include '../views/inc/head.php'; ?>
    </head>

    <body>
        <div class="main-container">
            <section class="hero-body">
                <div class="hero-body">
                    <p class="has-text-centered has-text-white pb-3">
                        <i class="fas fa-rocket fa-5x"></i>
                    </p>
                    <p class="title has-text-white">¡Ocurrió un error!</p>
                    <p class="subtitle has-text-white">No hemos encontrado datos de la cotizacion</p>
                </div>
            </section>
        </div>
        <?php include '../views/inc/script.php'; ?>
    </body>

    </html>
<?php } ?>