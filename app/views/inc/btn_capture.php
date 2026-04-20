<p class="has-text-right pt-4 pb-4">
    <button type="button" class="button is-info is-rounded" id="btn-descargar-ficha">
        <i class="fas fa-camera"></i> &nbsp; Descargar Ficha (1000x1000)
    </button>
</p>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

<script type="text/javascript">
document.getElementById('btn-descargar-ficha').addEventListener('click', function(){
    const tarjetaOriginal = document.getElementById('tarjeta-producto');
    
    // 1. Clona el elemento original para no afectar la vista actual
    const tarjetaClonada = tarjetaOriginal.cloneNode(true);
    const nombreProducto = tarjetaOriginal.getAttribute('data-nombre');

    // 2. Forzamos las dimensiones exactas en el clon y nos aseguramos que sea "visible" para html2canvas
    tarjetaClonada.style.width = "1000px";
    tarjetaClonada.style.height = "1000px";
    tarjetaClonada.style.display = "flex"; // Reafirmamos el centrado flex
    tarjetaClonada.style.alignItems = "center";
    tarjetaClonada.style.justifyContent = "center";
    tarjetaClonada.style.position = "absolute";
    tarjetaClonada.style.left = "-2000px"; // Lo movemos lejos para no verlo
    tarjetaClonada.style.top = "0";

    // 3. Añadimos el clon al cuerpo del documento (DOM) temporalmente
    document.body.appendChild(tarjetaClonada);

    // 4. Capturamos el clon forzando las medidas de ventana
    html2canvas(tarjetaClonada, {
        width: 1000,
        height: 1000,
        scale: 2, // Mantenemos la alta calidad
        useCORS: true,
        backgroundColor: "#ffffff",
        // Estas dos líneas son vitales para celulares:
        windowWidth: 1000, // Engañamos a html2canvas: "cree que el navegador mide 1000"
        windowHeight: 1000,
        // Eliminamos logging para limpiar la consola
        logging: false
    }).then(canvas => {
        // 5. Procedemos a la descarga
        const link = document.createElement('a');
        link.download = nombreProducto + '.png';
        link.href = canvas.toDataURL('image/png');
        link.click();

        // 6. Finalmente, eliminamos el clon del DOM para limpiar
        document.body.removeChild(tarjetaClonada);
    });
});
</script>