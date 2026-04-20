function calcularCosto() {
    let stock = parseFloat(document.getElementById("stock").value) || 0;
    let compra = parseFloat(document.getElementById("compra").value) || 0;
    let envio = parseFloat(document.getElementById("envio").value) || 0;

    if (stock > 0) {
        let total = compra + envio;
        let costoUnitario = total / stock;
        document.getElementById("costo_unitario").value = costoUnitario.toFixed(2);
    } else {
        document.getElementById("costo_unitario").value = "0.00";
    }
}

// Eventos en tiempo real
document.getElementById("stock").addEventListener("input", calcularCosto);
document.getElementById("compra").addEventListener("input", calcularCosto);
document.getElementById("envio").addEventListener("input", calcularCosto);

    