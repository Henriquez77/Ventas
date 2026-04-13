<div class="container is-fluid mb-6">
	<h1 class="title">Productos</h1>
	<h2 class="subtitle"><i class="fas fa-box fa-fw"></i> &nbsp; Nuevo producto</h2>
</div>

<div class="container pb-6 pr-5 pl-5">

	<form class="FormularioAjax" action="<?php echo APP_URL; ?>app/ajax/productoAjax.php" method="POST" autocomplete="off" enctype="multipart/form-data">

		<input type="hidden" name="modulo_producto" value="registrar">

		<div class="columns">			
				<?php
				// Tu código PHP puede ir aquí (si necesitas realizar algo al cargar la página).
				?>
				<div class="column">
					<div class="control" style="display: flex; flex-wrap: wrap; align-items: center;">
						<label style="flex: 1 1 100%;">Código de barra <?php echo CAMPO_OBLIGATORIO; ?></label>
						<input readonly id="codigo-barra" class="input" type="text" name="producto_codigo" pattern="[a-zA-Z0-9- ]{1,77}" maxlength="77" required style="flex: 1;">
						<button type="button" class="button" style="margin-left: 10px;" onclick="generarCodigo()">Generar Código</button>
					</div>
				</div>
				<script>
					// Función para generar un código aleatorio
					function generarCodigo() {
						const caracteres = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
						let codigo = '';
						for (let i = 0; i < 10; i++) {
							codigo += caracteres.charAt(Math.floor(Math.random() * caracteres.length));
						}
						document.getElementById('codigo-barra').value = codigo; // Colocar el código en el input
					}
				</script>
			<div class="column">
				<div class="control">
					<label>Nombre <?php echo CAMPO_OBLIGATORIO; ?></label>
					<input class="input" type="text" name="producto_nombre" pattern="[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ().,$#\-\/ ]{1,100}" maxlength="100" required>
				</div>
			</div>
		</div>
		<div class="columns">
			<div class="column">
				<div class="control">
					<label>Stock o existencias <?php echo CAMPO_OBLIGATORIO; ?></label>
					<input class="input" type="number" id="stock" step="0.01" name="producto_stock_total" pattern="[0-9]{1,22}" maxlength="22" required>
				</div>
			</div>
			<div class="column">
				<div class="control">
					<label>Costo total de la compra <?php echo CAMPO_OBLIGATORIO; ?></label>
					<input class="input" type="number" id="compra" step="0.01" name="producto_costo_compra" pattern="[0-9.]{1,25}" maxlength="25" value="0.00" required>
				</div>
			</div>
			<div class="column">
				<div class="control">
					<label>Costo del envio local <?php echo CAMPO_OBLIGATORIO; ?></label>
					<input class="input" type="number" id="envio" step="0.01" name="producto_costo_envio" pattern="[0-9.]{1,25}" maxlength="25" value="0.00" required>
				</div>
			</div>

		</div>
		<div class="columns">
			<div class="column">
				<div class="control">
					<label>Costo C/U <?php echo CAMPO_OBLIGATORIO; ?></label>
					<input class="input" type="number" step="0.01" id="costo_unitario" name="producto_costo_unidad" pattern="[0-9.]{1,25}" maxlength="25" value="0.00" required readonly>
				</div>
			</div>
			<div class="column">
				<div class="control">
					<label>Precio a vender C/U <?php echo CAMPO_OBLIGATORIO; ?></label>
					<input class="input" type="number" step="0.01" name="producto_precio_vender" pattern="[0-9.]{1,25}" maxlength="25" value="0.00" required>
				</div>
			</div>
			<div class="column">
				<div class="control">
					<label>Fecha ingresado <?php echo CAMPO_OBLIGATORIO; ?></label>
					<input class="input" type="date" name="producto_fecha_ingresado" required>
				</div>
			</div>
			<div class="column">
				<label>Categoría <?php echo CAMPO_OBLIGATORIO; ?></label><br>
				<div class="select">
					<select name="producto_categoria">
						<option value="" selected="">Seleccione una opción</option>
						<?php
						$datos_categorias = $insLogin->seleccionarDatos("Normal", "categoria", "*", 0);

						$cc = 1;
						while ($campos_categoria = $datos_categorias->fetch()) {
							echo '<option value="' . $campos_categoria['categoria_id'] . '">' . $cc . ' - ' . $campos_categoria['categoria_nombre'] . '</option>';
							$cc++;
						}
						?>
					</select>
				</div>
			</div>
		</div>
		<div class="columns">
			<div class="column">
				<label>Foto o imagen del producto</label><br>
				<div class="file is-small has-name">
					<label class="file-label">
						<input class="file-input" type="file" name="producto_foto" accept=".jpg, .png, .jpeg">
						<span class="file-cta">
							<span class="file-label">Imagen</span>
						</span>
						<span class="file-name">JPG, JPEG, PNG. (MAX 5MB)</span>
					</label>
				</div>
			</div>
		</div>
		<p class="has-text-centered">
			<button type="reset" class="button is-link is-light is-rounded"><i class="fas fa-paint-roller"></i> &nbsp; Limpiar</button>
			<button type="submit" class="button is-info is-rounded"><i class="far fa-save"></i> &nbsp; Guardar</button>
		</p>
		<p class="has-text-centered pt-6">
			<small>Los campos marcados con <?php echo CAMPO_OBLIGATORIO; ?> son obligatorios</small>
		</p>
	</form>
</div>