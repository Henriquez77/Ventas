<?php

namespace app\controllers;

use app\models\mainModel;

class gananciasController extends mainModel
{

    /*----------  Controlador listar ganancias  ----------*/
    public function listarGananciaControlador($pagina, $registros, $url, $busqueda)
    {
        $pagina = $this->limpiarCadena($pagina);
        $registros = $this->limpiarCadena($registros);

        $url = $this->limpiarCadena($url);
        $url = APP_URL . $url . "/";

        $busqueda = $this->limpiarCadena($busqueda);
        $tabla = "";

        $pagina = (isset($pagina) && $pagina > 0) ? (int)$pagina : 1;
        $inicio = ($pagina > 0) ? (($pagina * $registros) - $registros) : 0;

        $campos_tablas = "venta.venta_id, venta.venta_envio, venta.venta_codigo, 
            venta.venta_fecha, venta.venta_hora, venta.venta_total,

            cliente.cliente_nombre, cliente.cliente_apellido,

            COALESCE(SUM(vd.venta_detalle_cantidad * vd.venta_detalle_precio_compra),0) 
            + IFNULL(venta.venta_envio,0) AS costo_total,

            COALESCE(SUM(CASE 
                WHEN vd.producto_id = 41 THEN vd.venta_detalle_precio_compra 
                ELSE 0 END),0) AS descuento";

        if (isset($busqueda) && $busqueda != "") {
            $consulta_datos = "SELECT $campos_tablas
            FROM venta
            INNER JOIN cliente ON venta.cliente_id = cliente.cliente_id
            LEFT JOIN venta_detalle vd 
                ON venta.venta_codigo = vd.venta_codigo
            WHERE venta.venta_codigo = '$busqueda'
            GROUP BY venta.venta_id
            ORDER BY venta.venta_id DESC
            LIMIT $inicio, $registros";

            $consulta_total = "SELECT COUNT(venta_id) 
            FROM venta 
            WHERE venta.venta_codigo = '$busqueda'";
        } else {
           $consulta_datos = "SELECT $campos_tablas
            FROM venta
            INNER JOIN cliente ON venta.cliente_id = cliente.cliente_id
            LEFT JOIN venta_detalle vd 
                ON venta.venta_codigo = vd.venta_codigo
            GROUP BY venta.venta_id
            ORDER BY venta.venta_id DESC
            LIMIT $inicio, $registros";

            $consulta_total = "SELECT COUNT(venta_id) FROM venta";
        }

        $datos = $this->ejecutarConsulta($consulta_datos);
        $datos = $datos->fetchAll();

        $total = $this->ejecutarConsulta($consulta_total);
        $total = (int)$total->fetchColumn();

        $numeroPaginas = ceil($total / $registros);

        $tabla .= '
                <div class="table-container">
                <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                    <thead>
                        <tr>
                            <th class="has-text-centered">NRO.</th>
                            <th class="has-text-centered">Codigo</th>
                            <th class="has-text-centered">Cliente</th>
                            <th class="has-text-centered">Fecha</th>
                            <th class="has-text-centered">Costo Invertido</th>
                            <th class="has-text-centered">Total Venta</th>
                            <th class="has-text-centered">Ganancias Venta</th>
                        </tr>
                    </thead>
                    <tbody>
            ';

        if ($total >= 1 && $pagina <= $numeroPaginas) {
            $contador = $inicio + 1;
            $pag_inicio = $inicio + 1;

            foreach ($datos as $rows) {
                // Calcular el costo invertido (suma del costo de compra por cantidad)
                $venta_codigo = $rows['venta_codigo'];
                $costo_total = (float)$rows['costo_total'];
                $descuento = (float)$rows['descuento'];

                // total real descontando producto 41
                $total_real = $rows['venta_total'] - $descuento;

                // ganancias reales
                $ganancias_venta = $total_real - $costo_total;


                // Calcular las ganancias
                $ganancias_venta = $rows['venta_total'] - $costo_total;

                // Formatear las columnas
                $tabla .= '
                        <tr class="has-text-centered">
                            <td>' . $contador . '</td>
                            <td>' . $rows['venta_codigo'] . '</td>
                            <td>' . $this->limitarCadena($rows['cliente_nombre'].' '.$rows['cliente_apellido'], 30, "...") . '</td>
                            <td>' . date("d-m-Y", strtotime($rows['venta_fecha'])) . ' ' . $rows['venta_hora'] . '</td>
                            <td>' . MONEDA_SIMBOLO . number_format($costo_total, MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . '</td>
                            <td>' . MONEDA_SIMBOLO . number_format($total_real, MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . '</td>
                            <td>' . MONEDA_SIMBOLO . number_format($ganancias_venta, MONEDA_DECIMALES, MONEDA_SEPARADOR_DECIMAL, MONEDA_SEPARADOR_MILLAR) . '</td>
                        </tr>
                    ';
                $contador++;
            }
            $pag_final = $contador - 1;
        } else {
            if ($total >= 1) {
                $tabla .= '
                        <tr class="has-text-centered">
                            <td colspan="6">
                                <a href="' . $url . '1/" class="button is-link is-rounded is-small mt-4 mb-4">
                                    Haga clic acá para recargar el listado
                                </a>
                            </td>
                        </tr>
                    ';
            } else {
                $tabla .= '
                        <tr class="has-text-centered">
                            <td colspan="6">
                                No hay registros en el sistema
                            </td>
                        </tr>
                    ';
            }
        }

        $tabla .= '</tbody></table></div>';

        // Paginación
        if ($total > 0 && $pagina <= $numeroPaginas) {
            $tabla .= '<p class="has-text-right">Mostrando ventas <strong>' . $pag_inicio . '</strong> al <strong>' . $pag_final . '</strong> de un <strong>total de ' . $total . '</strong></p>';
            $tabla .= $this->paginadorTablas($pagina, $numeroPaginas, $url, 7);
        }

        return $tabla;
    }
}
