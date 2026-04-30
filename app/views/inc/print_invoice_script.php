<script>
    function print_ticket(url){
        window.open(url,'Imprimir ticket','width=400,height=720,top=0,left=100,menubar=NO,toolbar=YES');
    }
    function print_invoice(url){

    // 1. Abrir PDF
    window.open(url,'Imprimir factura','width=820,height=720,top=0,left=100,menubar=NO,toolbar=YES');

    // 2. Obtener el code de la URL
    let params = new URLSearchParams(url.split('?')[1]);
    let code = params.get("code");

    // 3. Enviar correo en segundo plano
    fetch("<?php echo APP_URL; ?>app/pdf/enviarfactura.php?code=" + code)
        .then(res => res.text())
        .then(data => console.log("Correo enviado"))
        .catch(err => console.error("Error enviando correo", err));
}
</script>