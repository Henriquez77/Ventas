<?php

namespace app\controllers;

use app\models\mainModel;


class quotationController extends mainModel
{

    public function registrarCotizacionControlador()
    {

        /*== Validar productos ==*/
        if ($_SESSION['cotizacion_total'] <= 0 || (!isset($_SESSION['datos_producto_cotizacion']) || count($_SESSION['datos_producto_cotizacion']) <= 0)) {
            $alerta = [
                "tipo" => "simple",
                "titulo" => "Ocurrió un error inesperado",
                "texto" => "No ha agregado productos a la cotización",
                "icono" => "error"
            ];
            return json_encode($alerta);
            exit();
        }

        /*== Validar cliente ==*/
        if (!isset($_SESSION['datos_cliente_cotizacion'])) {
            $alerta = [
                "tipo" => "simple",
                "titulo" => "Ocurrió un error inesperado",
                "texto" => "No ha seleccionado ningún cliente",
                "icono" => "error"
            ];
            return json_encode($alerta);
            exit();
        }

        /*== Verificar cliente en DB ==*/
        $check_cliente = $this->ejecutarConsulta(
            "SELECT cliente_id FROM cliente WHERE cliente_id='" . $_SESSION['datos_cliente_cotizacion']['cliente_id'] . "'"
        );
        if ($check_cliente->rowCount() <= 0) {
            $alerta = [
                "tipo" => "simple",
                "titulo" => "Ocurrió un error inesperado",
                "texto" => "Cliente no encontrado",
                "icono" => "error"
            ];
            return json_encode($alerta);
            exit();
        }

        /*== Calcular envío ==*/
        $cotizacion_envio = 0;
        foreach ($_SESSION['datos_producto_cotizacion'] as $producto) {
            $cotizacion_envio += floatval($producto['cotizacion_envio_costo']);
        }
        $cotizacion_envio = number_format($cotizacion_envio, MONEDA_DECIMALES, '.', '');

        /*== Totales ==*/
        $cotizacion_total = floatval($_SESSION['cotizacion_total']);
        $cotizacion_total = number_format($cotizacion_total, MONEDA_DECIMALES, '.', '');

        $cotizacion_fecha = date("Y-m-d");
        $cotizacion_hora = date("h:i a");

        /*== Código ==*/
        $correlativo = $this->ejecutarConsulta("SELECT cotizacion_id FROM cotizacion");
        $correlativo = ($correlativo->rowCount()) + 1;
        $codigo = $this->generarCodigoAleatorio(10, $correlativo);

        /*== Guardar cotización ==*/
        $datos = [
            [
                "campo_nombre" => "cotizacion_codigo",
                "campo_marcador" => ":Codigo",
                "campo_valor" => $codigo
            ],
            [
                "campo_nombre" => "cotizacion_fecha",
                "campo_marcador" => ":Fecha",
                "campo_valor" => $cotizacion_fecha
            ],
            [
                "campo_nombre" => "cotizacion_hora",
                "campo_marcador" => ":Hora",
                "campo_valor" => $cotizacion_hora
            ],
            [
                "campo_nombre" => "cotizacion_total",
                "campo_marcador" => ":Total",
                "campo_valor" => $cotizacion_total
            ],
            [
                "campo_nombre" => "cotizacion_envio",
                "campo_marcador" => ":Envio",
                "campo_valor" => $cotizacion_envio
            ],
            [
                "campo_nombre" => "usuario_id",
                "campo_marcador" => ":Usuario",
                "campo_valor" => $_SESSION['id']
            ],
            [
                "campo_nombre" => "cliente_id",
                "campo_marcador" => ":Cliente",
                "campo_valor" => $_SESSION['datos_cliente_cotizacion']['cliente_id']
            ]
        ];

        $guardar = $this->guardarDatos("cotizacion", $datos);

        if ($guardar->rowCount() != 1) {
            $alerta = [
                "tipo" => "simple",
                "titulo" => "Error",
                "texto" => "No se pudo registrar la cotización",
                "icono" => "error"
            ];
            return json_encode($alerta);
            exit();
        }

        /*== Guardar detalle ==*/
        foreach ($_SESSION['datos_producto_cotizacion'] as $detalle) {

            $datos_detalle = [
                [
                    "campo_nombre" => "cotizacion_detalle_cantidad",
                    "campo_marcador" => ":Cantidad",
                    "campo_valor" => $detalle['cotizacion_detalle_cantidad']
                ],
                [
                    "campo_nombre" => "cotizacion_detalle_precio_compra",
                    "campo_marcador" => ":PC",
                    "campo_valor" => $detalle['cotizacion_detalle_precio_compra']
                ],
                [
                    "campo_nombre" => "cotizacion_detalle_precio_venta",
                    "campo_marcador" => ":PV",
                    "campo_valor" => $detalle['cotizacion_detalle_precio_venta']
                ],
                [
                    "campo_nombre" => "cotizacion_detalle_total",
                    "campo_marcador" => ":Total",
                    "campo_valor" => $detalle['cotizacion_detalle_total']
                ],
                [
                    "campo_nombre" => "cotizacion_detalle_descripcion",
                    "campo_marcador" => ":Desc",
                    "campo_valor" => $detalle['cotizacion_detalle_descripcion']
                ],
                [
                    "campo_nombre" => "cotizacion_codigo",
                    "campo_marcador" => ":Codigo",
                    "campo_valor" => $codigo
                ],
                [
                    "campo_nombre" => "producto_id",
                    "campo_marcador" => ":Producto",
                    "campo_valor" => $detalle['producto_id']
                ]
            ];

            $this->guardarDatos("cotizacion_detalle", $datos_detalle);
        }

        /*== Limpiar sesión ==*/
        unset($_SESSION['cotizacion_total']);
        unset($_SESSION['datos_producto_cotizacion']);
        unset($_SESSION['datos_cliente_cotizacion']);

        $_SESSION['cotizacion_codigo'] = $codigo;

        $alerta = [
            "tipo" => "recargar",
            "titulo" => "¡Cotización registrada!",
            "texto" => "La cotización se guardó correctamente",
            "icono" => "success"
        ];

        return json_encode($alerta);
    }
    public function buscarCodigoCotizacionControlador()
    {
        $producto = $this->limpiarCadena($_POST['buscar_codigo']);

        if ($producto == "") {
            return '
        <article class="message is-warning mt-4 mb-4">
            <div class="message-header">
                <p>¡Ocurrió un error inesperado!</p>
            </div>
            <div class="message-body has-text-centered">
                Debes introducir el nombre del producto
            </div>
        </article>';
        }

        $datos_productos = $this->ejecutarConsulta("SELECT * FROM producto WHERE producto_nombre LIKE '%$producto%' ORDER BY producto_nombre ASC");

        if ($datos_productos->rowCount() >= 1) {

            $datos_productos = $datos_productos->fetchAll();

            $tabla = '<div class="table-container"><table class="table is-fullwidth"><tbody>';

            foreach ($datos_productos as $rows) {
                $tabla .= '
            <tr>
                <td>' . $rows['producto_nombre'] . '</td>
                <td class="has-text-centered">
                    <button type="button" class="button is-link is-small" onclick="agregar_codigo(\'' . $rows['producto_codigo'] . '\')">
                        +
                    </button>
                </td>
            </tr>';
            }

            $tabla .= '</tbody></table></div>';
            return $tabla;
        } else {
            return '<article class="message is-warning">No se encontraron productos</article>';
        }
    }
    public function agregarProductoCotizacionControlador()
    {
        $codigo = $this->limpiarCadena($_POST['producto_codigo']);

        if ($codigo == "") {
            return json_encode([
                "tipo" => "simple",
                "titulo" => "Error",
                "texto" => "Código vacío",
                "icono" => "error"
            ]);
        }

        $check = $this->ejecutarConsulta("SELECT * FROM producto WHERE producto_codigo='$codigo'");

        if ($check->rowCount() <= 0) {
            return json_encode([
                "tipo" => "simple",
                "titulo" => "Error",
                "texto" => "Producto no encontrado",
                "icono" => "error"
            ]);
        }

        $producto = $check->fetch();

        if (empty($_SESSION['datos_producto_cotizacion'][$codigo])) {

            $cantidad = 1;
            $total = $cantidad * $producto['producto_precio_vender'];

            $_SESSION['datos_producto_cotizacion'][$codigo] = [
                "producto_id" => $producto['producto_id'],
                "producto_codigo" => $producto['producto_codigo'],
                "cotizacion_detalle_precio_compra" => $producto['producto_costo_unidad'],
                "cotizacion_detalle_precio_venta" => $producto['producto_precio_vender'],
                "cotizacion_detalle_cantidad" => 1,
                "cotizacion_envio_costo" => $producto['producto_envio_venta'],
                "cotizacion_detalle_total" => number_format($total, MONEDA_DECIMALES, '.', ''),
                "cotizacion_detalle_descripcion" => $producto['producto_nombre']
            ];
        } else {

            $cantidad = $_SESSION['datos_producto_cotizacion'][$codigo]['cotizacion_detalle_cantidad'] + 1;
            $total = $cantidad * $producto['producto_precio_vender'];

            $_SESSION['datos_producto_cotizacion'][$codigo]['cotizacion_detalle_cantidad'] = $cantidad;
            $_SESSION['datos_producto_cotizacion'][$codigo]['cotizacion_detalle_total'] = number_format($total, MONEDA_DECIMALES, '.', '');
        }

        return json_encode([
            "tipo" => "redireccionar",
            "url" => APP_URL . "quotationNew/"
        ]);
    }
    public function removerProductoCotizacionControlador()
    {
        $codigo = $this->limpiarCadena($_POST['producto_codigo']);

        unset($_SESSION['datos_producto_cotizacion'][$codigo]);

        return json_encode([
            "tipo" => "recargar",
            "titulo" => "Producto eliminado",
            "texto" => "Se removió de la cotización",
            "icono" => "success"
        ]);
    }
    public function actualizarProductoCotizacionControlador()
    {
        $codigo = $this->limpiarCadena($_POST['producto_codigo']);
        $cantidad = $this->limpiarCadena($_POST['producto_cantidad']);
        $envio = $this->limpiarCadena($_POST['producto_envio']);

        if ($codigo == "" || $cantidad <= 0) {
            return json_encode([
                "tipo" => "simple",
                "titulo" => "Error",
                "texto" => "Datos inválidos",
                "icono" => "error"
            ]);
        }

        $check = $this->ejecutarConsulta("SELECT * FROM producto WHERE producto_codigo='$codigo'");

        if ($check->rowCount() <= 0) {
            return json_encode([
                "tipo" => "simple",
                "titulo" => "Error",
                "texto" => "Producto no existe",
                "icono" => "error"
            ]);
        }

        $producto = $check->fetch();

        $total = $cantidad * $producto['producto_precio_vender'];

        $_SESSION['datos_producto_cotizacion'][$codigo] = [
            "producto_id" => $producto['producto_id'],
            "producto_codigo" => $producto['producto_codigo'],
            "cotizacion_detalle_precio_compra" => $producto['producto_costo_unidad'],
            "cotizacion_detalle_precio_venta" => $producto['producto_precio_vender'],
            "cotizacion_detalle_cantidad" => $cantidad,
            "cotizacion_envio_costo" => $envio,
            "cotizacion_detalle_total" => number_format($total, MONEDA_DECIMALES, '.', ''),
            "cotizacion_detalle_descripcion" => $producto['producto_nombre']
        ];

        return json_encode([
            "tipo" => "redireccionar",
            "url" => APP_URL . "quotationNew/"
        ]);
    }
    /*---------- Controlador buscar cliente ----------*/
    public function buscarClienteCotizacionControlador()
    {

        /*== Recuperando termino de busqueda ==*/
        $cliente = $this->limpiarCadena($_POST['buscar_cliente']);

        /*== Comprobando que no este vacio el campo ==*/
        if ($cliente == "") {
            return '
				<article class="message is-warning mt-4 mb-4">
					 <div class="message-header">
					    <p>¡Ocurrio un error inesperado!</p>
					 </div>
				    <div class="message-body has-text-centered">
				    	<i class="fas fa-exclamation-triangle fa-2x"></i><br>
						Debes de introducir el Numero de documento, Nombre, Apellido o Teléfono del cliente
				    </div>
				</article>';
            exit();
        }

        /*== Seleccionando clientes en la DB ==*/
        $datos_cliente = $this->ejecutarConsulta("SELECT * FROM cliente WHERE (cliente_id!='1') AND (cliente_numero_documento LIKE '%$cliente%' OR cliente_nombre LIKE '%$cliente%' OR cliente_apellido LIKE '%$cliente%' OR cliente_telefono LIKE '%$cliente%') ORDER BY cliente_nombre ASC");

        if ($datos_cliente->rowCount() >= 1) {

            $datos_cliente = $datos_cliente->fetchAll();

            $tabla = '<div class="table-container mb-6"><table class="table is-striped is-narrow is-hoverable is-fullwidth"><tbody>';

            foreach ($datos_cliente as $rows) {
                $tabla .= '
					<tr>
                        <td class="has-text-left" ><i class="fas fa-male fa-fw"></i> &nbsp; ' . $rows['cliente_nombre'] . ' ' . $rows['cliente_apellido'] . ' (' . $rows['cliente_tipo_documento'] . ': ' . $rows['cliente_numero_documento'] . ')</td>
                        <td class="has-text-centered" >
                            <button type="button" class="button is-link is-rounded is-small" onclick="agregar_cliente(' . $rows['cliente_id'] . ')"><i class="fas fa-user-plus"></i></button>
                        </td>
                    </tr>
                    ';
            }

            $tabla .= '</tbody></table></div>';
            return $tabla;
        } else {
            return '
				<article class="message is-warning mt-4 mb-4">
					 <div class="message-header">
					    <p>¡Ocurrio un error inesperado!</p>
					 </div>
				    <div class="message-body has-text-centered">
				    	<i class="fas fa-exclamation-triangle fa-2x"></i><br>
						No hemos encontrado ningún cliente en el sistema que coincida con <strong>“' . $cliente . '”</strong>
				    </div>
				</article>';
            exit();
        }
    }


    /*---------- Controlador agregar cliente ----------*/
    public function agregarClienteCotizacionControlador()
    {
        $id = $this->limpiarCadena($_POST['cliente_id']);

        $check_cliente = $this->ejecutarConsulta("SELECT * FROM cliente WHERE cliente_id='$id'");

        if ($check_cliente->rowCount() <= 0) {
            return json_encode([
                "tipo" => "simple",
                "titulo" => "Error",
                "texto" => "Cliente no encontrado",
                "icono" => "error"
            ]);
        }

        $campos = $check_cliente->fetch();

        /*== ASIGNAR CLIENTE DIRECTAMENTE ==*/
        $_SESSION['datos_cliente_cotizacion'] = [
            "cliente_id" => $campos['cliente_id'],
            "cliente_tipo_documento" => $campos['cliente_tipo_documento'],
            "cliente_numero_documento" => $campos['cliente_numero_documento'],
            "cliente_nombre" => $campos['cliente_nombre'],
            "cliente_apellido" => $campos['cliente_apellido'],
            "cliente_email" => $campos['cliente_email']
        ];

        return json_encode([
            "tipo" => "recargar",
            "titulo" => "¡Cliente agregado!",
            "texto" => "El cliente se agregó a la cotización",
            "icono" => "success"
        ]);
    }


    /*---------- Controlador remover cliente ----------*/
    public function removerClienteCotizacionControlador()
    {
        unset($_SESSION['datos_cliente_cotizacion']);

        return json_encode([
            "tipo" => "recargar",
            "titulo" => "Cliente removido",
            "texto" => "El cliente fue eliminado de la cotización",
            "icono" => "success"
        ]);
    }
}
