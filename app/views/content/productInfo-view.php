
<div class="container is-fluid mb-6">
	<h1 class="title">Productos</h1>
	<h2 class="subtitle"><i class="fas fa-info-circle"></i> &nbsp; Información del producto</h2>
</div>

<div class="container pb-6 pt-6 pr-6 pl-6">
	<?php
	
		include "./app/views/inc/btn_back.php";
        include "./app/views/inc/btn_capture.php";

		$id=$insLogin->limpiarCadena($url[1]);

		$datos=$insLogin->seleccionarDatos("Unico","producto","producto_id",$id);

		if($datos->rowCount()==1){
			$datos=$datos->fetch();
			$_SESSION['producto_nombre'] = $datos['producto_nombre'];
	?>

	<h2 class="title has-text-centered has-text-link">
		<?php echo $datos['producto_nombre']; ?>
	</h2>

	<div class="columns">

		<!-- IMAGEN -->
		<div class="column is-two-fifths">
			<h4 class="subtitle is-4 has-text-centered pb-6 has-text-weight-bold"><em>Imagen del producto</em></h4>

			<figure class="image mb-6">
				<?php if(is_file("./app/views/productos/".$datos['producto_foto'])){ ?>
					<img class="is-photo" src="<?php echo APP_URL; ?>app/views/productos/<?php echo $datos['producto_foto']; ?>">
				<?php }else{ ?>
					<img class="is-photo" src="<?php echo APP_URL; ?>app/views/productos/default.png">
				<?php } ?>
			</figure>
		</div>

		<!-- INFORMACIÓN -->
		<div class="column">
			<h4 class="subtitle is-4 has-text-centered pb-6 has-text-weight-bold"><em>Detalles</em></h4>

			<div class="content">

				<p><strong>Código:</strong> <?php echo $datos['producto_codigo']; ?></p>

				<p><strong>Precio:</strong> $<?php echo $datos['producto_precio_vender']; ?></p>

				<p hidden><strong>Stock:</strong> <?php echo $datos['producto_stock_total']; ?></p>

				<p>
					<strong>Estado:</strong> 
					<span class="tag <?php echo ($datos['producto_estado']=="disponible") ? "is-success" : "is-danger"; ?>">
						<?php echo $datos['producto_estado']; ?>
					</span>
				</p>

				<p><strong>Descripción:</strong></p>
				<p class="has-text-justified">
					<?php echo (!empty($datos['producto_descripcion'])) ? $datos['producto_descripcion'] : "Sin descripción disponible."; ?>
				</p>

			</div>

		</div>

	</div>
	<div class="contenedor-invisible">
    <div id="tarjeta-producto" data-nombre="<?php echo $datos['producto_nombre']; ?>">
        <div class="columns is-vcentered columns-container mt-6 margin-photo"> 
            <div class="column is-5">
                    <div class="is-photo-container">
                        <figure class="image">
                            <?php if(is_file("./app/views/productos/".$datos['producto_foto'])){ ?>
                                <img class="is-photo" src="<?php echo APP_URL; ?>app/views/productos/<?php echo $datos['producto_foto']; ?>">
                            <?php }else{ ?>
                                <img class="is-photo" src="<?php echo APP_URL; ?>app/views/productos/default.png">
                            <?php } ?>
                        </figure>
                    </div>
                </div>
    
            <div class="column is-7">
    
                <div class="content pl-5"> <p><strong>Código:</strong> <span class="has-text-grey-darker"><?php echo $datos['producto_codigo']; ?></span></p>
    
                    <p><strong>Precio:</strong> <span class="has-text-primary is-size-3 has-text-weight-bold">$<?php echo $datos['producto_precio_vender']; ?></span></p>
    
                    <p>
                        <strong>Estado:</strong>
                        <span class="tag is-large <?php echo ($datos['producto_estado']=="disponible") ? "is-success" : "is-danger"; ?>">
                            <?php echo $datos['producto_estado']; ?>
                        </span>
                    </p>
    
                    <p class="has-text-weight-bold mb-2">Descripción:</p>
                    <p class="is-size-5 has-text-justified forzar-salto-linea">
                        <?php echo (!empty($datos['producto_descripcion'])) ? $datos['producto_descripcion'] : "Sin descripción disponible."; ?>
                    </p>
    
                </div>
            </div>
    
        </div>
    </div>
</div>
   
	<?php
		}else{
			include "./app/views/inc/error_alert.php";
		}
	?>
</div>