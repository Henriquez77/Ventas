<?php
	
	require_once "../../config/app.php";
	require_once "../views/inc/session_start.php";
	require_once "../../autoload.php";
	
	use app\controllers\quotationController;


	if(isset($_POST['modulo_cotizacion'])){

		$insCotizacion = new quotationController();

		/*--------- Buscar producto ---------*/
		if($_POST['modulo_cotizacion']=="buscar_codigo"){
			echo $insCotizacion->buscarCodigoCotizacionControlador();
		}

		/*--------- Agregar producto ---------*/
		if($_POST['modulo_cotizacion']=="agregar_producto"){
			echo $insCotizacion->agregarProductoCotizacionControlador();
        }

        /*--------- Remover producto ---------*/
		if($_POST['modulo_cotizacion']=="remover_producto"){
			echo $insCotizacion->removerProductoCotizacionControlador();
		}

		/*--------- Actualizar producto ---------*/
		if($_POST['modulo_cotizacion']=="actualizar_producto"){
			echo $insCotizacion->actualizarProductoCotizacionControlador();
		}

		/*--------- Buscar cliente ---------*/
		if($_POST['modulo_cotizacion']=="buscar_cliente"){
			echo $insCotizacion->buscarClienteCotizacionControlador();
		}

		/*--------- Agregar cliente ---------*/
		if($_POST['modulo_cotizacion']=="agregar_cliente"){
			echo $insCotizacion->agregarClienteCotizacionControlador();
		}

		/*--------- Remover cliente ---------*/
		if($_POST['modulo_cotizacion']=="remover_cliente"){
			echo $insCotizacion->removerClienteCotizacionControlador();
		}

		/*--------- Registrar cotización ---------*/
		if($_POST['modulo_cotizacion']=="registrar_cotizacion"){
			echo $insCotizacion->registrarCotizacionControlador();
		}

		/*--------- Eliminar cotización ---------
		if($_POST['modulo_cotizacion']=="eliminar_cotizacion"){
			echo $insCotizacion->eliminarCotizacionControlador();
		}*/
		
	}else{
		session_destroy();
		header("Location: ".APP_URL."login/");
	}