<div class="container is-fluid mb-6">
	<h1 class="title">Ganancias</h1>
	<h2 class="subtitle"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Reporte de ganancias por venta</h2>
</div>
<div class="container pb-6 pr-6 pl-6">

	<div class="form-rest mb-6 mt-6"></div>

	<?php
		use app\controllers\gananciasController;

		$insVenta = new gananciasController();

		echo $insVenta->listarGananciaControlador($url[1],15,$url[0],"");

	?>
</div>